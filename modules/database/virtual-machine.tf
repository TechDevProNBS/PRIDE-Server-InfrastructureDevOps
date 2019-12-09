resource "azurerm_virtual_machine" "database" {
    name = "${var.prefix}-database-vm"
    resource_group_name = var.resource_group.name
    location = var.resource_group.location
    network_interface_ids = [azurerm_network_interface.database.id]
    vm_size = "Standard_DS1_v2"

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
    
    }

    storage_os_disk {
    name              = "${var.prefix}-database-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    
    }

    os_profile {
    computer_name  = "${var.prefix}-database-vm"
    admin_username = var.admin_user
    
    }

    # Remote connection
    os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin}/.ssh/authorized_keys"
	key_data = "${file("/home/user/.ssh/id_rsa.pub")}"
        }
    }
}