resource "azurerm_network_security_group" "database" {
    name                = "database-nsg"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name
    
   # security_rule {
    #    name                       = "mysql"
    #    priority                   = 1001
    #    direction                  = "Inbound"
    #    access                     = "Allow"
    #    protocol                   = "Tcp"
    #    source_port_range          = "*"
    #    destination_port_range     = "3306"
    #    source_address_prefix      = "*"
    #    destination_address_prefix = "*"
    #}
}