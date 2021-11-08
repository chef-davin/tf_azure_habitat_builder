resource "null_resource" "configure_bldr" {
  depends_on = [
    null_resource.server_configure,
  ]

  provisioner "file" {
    source      = "${path.module}/data/bldr-20211108175448.box.key"
    destination = "/tmp/bldr-20211108175448.box.key"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "file" {
    source      = "${path.module}/data/bldr-20211108175448.pub"
    destination = "/tmp/bldr-20211108175448.pub"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "file" {
    source      = "${path.module}/scripts/builder-setup.sh"
    destination = "/tmp/builder-setup.sh"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/bldr-* /hab/cache/keys/",
      "chmod +x /tmp/builder-setup.sh",
      "sudo /tmp/builder-setup.sh -u ${azurerm_public_ip.builder_public_ip.fqdn} -i ${var.oauth_client_id} -s ${var.oauth_client_secret}"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}
