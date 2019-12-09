resource "azurerm_network_interface" "back_end" {
  name                = "${terraform.workspace}-back_end-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.back_end.id


  ip_configuration {
    name                          = "${terraform.workspace}-back_end"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "10.0.2.11/24"
  }
}