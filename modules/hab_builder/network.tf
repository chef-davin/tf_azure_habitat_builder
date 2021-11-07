# Create virtual network
resource "azurerm_virtual_network" "builder_vnet" {
  name                = "${var.architecture_prefix}_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    X-Contact = var.x_contact_tag
    X-Dept    = var.x_dept_tag
  }
}

# Create subnet
resource "azurerm_subnet" "builder_subnet" {
  name                 = "${var.architecture_prefix}_builder_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.builder_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}