resource "azurerm_network_interface" "manager_nic" {
  name                = "${var.prefix}-manager"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.manager_nsg.id


  ip_configuration {
    name                          = "${terraform.workspace}-manager"
    subnet_id                     = azurerm_subnet.manager_net.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.manager.id
  }
}   