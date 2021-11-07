resource "azurerm_network_security_group" "builder_nsg" {
  name                = "${var.architecture_prefix}_nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

resource "azurerm_network_security_rule" "builder_nsg_http_rule" {
  name                        = "HTTP"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.builder_nsg.name
}

resource "azurerm_network_security_rule" "builder_nsg_https_rule" {
  name                        = "HTTPS"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.builder_nsg.name
}

resource "azurerm_network_security_rule" "builder_nsg_ssh_rule" {
  name                        = "SSH"
  priority                    = 1100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefixes     = var.nsg_ssh_source_address_prefixes
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.builder_nsg.name
}
