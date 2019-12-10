resource "azurerm_network_interface" "front_end" {
  name                = "${terraform.workspace}-front_end-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.front_end.id


  ip_configuration {
    name                          = "${terraform.workspace}-front_end"
    subnet_id                     = azurerm_subnet.frontend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.front_end.id
  }
}