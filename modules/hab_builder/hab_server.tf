#Deploy Public IP
resource "azurerm_public_ip" "builder_public_ip" {
  name                = "${var.architecture_prefix}_bldr_pubip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  domain_name_label   = "${var.architecture_prefix}-bldr"

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

#Create NIC
resource "azurerm_network_interface" "builder_nic" {
  name                = "${var.architecture_prefix}_bldr_nic"  
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.builder_subnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.builder_public_ip.id
  }

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

resource "azurerm_network_interface_security_group_association" "builder_nsg_nic_assoc" {
  network_interface_id      = azurerm_network_interface.builder_nic.id
  network_security_group_id = azurerm_network_security_group.builder_nsg.id
}

#Create Boot Diagnostic Account
resource "azurerm_storage_account" "builder_storage" {
  name                     = "${var.architecture_prefix}labstor" 
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

#Create Virtual Machine
resource "azurerm_linux_virtual_machine" "builder_server" {
  name                  = "${var.architecture_prefix}-bldrvm"  
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.builder_nic.id]
  size               = "Standard_D2s_v4"
  disable_password_authentication = true

  admin_username = var.ssh_username
  admin_ssh_key {
    username   = var.ssh_username
    public_key = file(var.ssh_pub_file_location)
  }

  source_image_reference {
    publisher    = var.builder_source_image_publisher
    offer        = var.builder_source_image_offer
    sku          = var.builder_source_image_sku
    version      = var.builder_source_image_version
  }

  plan {
    name      = var.builder_plan_name
    product   = var.builder_plan_product
    publisher = var.builder_plan_publisher
  }

  os_disk {
    name                 = "bldr_osdisk1"
    disk_size_gb         = "75"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.builder_storage.primary_blob_endpoint
  }

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

#Create Secondary Disk
resource "azurerm_managed_disk" "secondary_disk" {
  depends_on = [
    azurerm_linux_virtual_machine.builder_server,
  ]
  name                 = "${var.architecture_prefix}_bldr_disk2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "150"

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "builder_attach_disk" {
  managed_disk_id    = azurerm_managed_disk.secondary_disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.builder_server.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "null_resource" "disable_selinux" {
  depends_on = [
    azurerm_linux_virtual_machine.builder_server,
    azurerm_virtual_machine_data_disk_attachment.builder_attach_disk,
  ]
  provisioner "remote-exec" {
    inline = [
      "sudo sed -i \"s/SELINUX=enforcing/SELINUX=disabled/g\" /etc/selinux/config",
      "sudo shutdown -r +0"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "server_configure" {
  depends_on = [
    azurerm_linux_virtual_machine.builder_server,
    azurerm_virtual_machine_data_disk_attachment.builder_attach_disk,
    null_resource.disable_selinux,
  ]

  provisioner "file" {
    source      = "${path.module}/scripts/server-configure.sh"
    destination = "/tmp/server-configure.sh"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/server-configure.sh",
      "sudo /tmp/server-configure.sh -u ${azurerm_public_ip.builder_public_ip.fqdn} -m ${var.letsencrypt_email}"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}
