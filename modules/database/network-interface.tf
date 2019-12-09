resource "azurerm_network_interface" "database" {
  name                = "${terraform.workspace}-database-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.database.id


  ip_configuration {
    name                          = "${terraform.workspace}-database"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "10.0.4.11/24"
    public_ip_address_id          = azurerm_public_ip.database.id
  }
}