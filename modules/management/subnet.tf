resource "azurerm_subnet" "manager_net" {
    name = "manager"
    resource_group_name = var.resource_group.name
    virtual_network_name = var.virtual_network.name
    address_prefix       = var.subnet_cidr
}