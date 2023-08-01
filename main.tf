provider "azurerm" {
  features {
  }
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resourcegroupname
  location = "eastus"

  tags = {
    Env    = "Production"
    author = "Hanu"
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "backendstorage"
    storage_account_name = "backendstorage1234"
    container_name       = "backendstate"
    key                  = "dev.terraform.tfstate"
  }
}

resource "azurerm_storage_account" "Sa" {
  name                     = var.storageaccountname
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "blob" {
  name                  = "hanublob1"
  storage_account_name  = azurerm_storage_account.Sa.name
  container_access_type = "blob"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtualnetwork
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = var.subnet
    address_prefix = "10.0.1.0/24"
  }
}