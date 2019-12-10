resource "azurerm_virtual_machine" "backend" {
  name                  = "${terraform.workspace}-backend-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.back_end.id]
  vm_size               = "Standard_B1ms"

  # May need to bump to "Standard_B2" if 1 core does not suffice

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-backend-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-backend-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	  path = "/home/${var.admin_user}/.ssh/authorized_keys"
	  key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
	  }
  }
}