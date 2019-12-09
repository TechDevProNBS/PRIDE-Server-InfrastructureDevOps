resource "azurerm_subnet" "default" {
  name                 = "internal"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.0.1.0/24"
}
