# may need to change this 
terraform {
  backend "azurerm" {
    storage_account_name  = var.storage_account_name
    container_name        = "pride"
    key                   = "terraform.pride"
  }
}

provider "azurerm" {
	version = "=1.30.1"
}

module "back-end" {
  source = "./modules/back-end"
  admin_user = "jenkins"
  resource_group = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "database" {
  source = "./modules/database"
  admin_user = "jenkins"
  resource_group = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "front-end" {
  source = "./modules/front-end"
  admin_user = "jenkins"
  resource_group = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "management" {
  source = "./modules/management"
  admin_user = "jenkins"
  resource_group = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

resource "azurerm_resource_group" "default" {
  name     = terraform.workspace
  location = "uksouth"
}

resource "azurerm_virtual_network" "default" {
  name                = "${terraform.workspace}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
}