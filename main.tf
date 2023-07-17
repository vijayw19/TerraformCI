terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
  cloud {
    organization = "amviorg"

    workspaces {
      name = "dev-workspace"
    }
  }

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "dt-rg-001"
  location = "East US"

}

resource "azurerm_storage_account" "this" {
  name                     = "dt-sg-account"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  access_tier              = "Standard"
  account_replication_type = "GRS"
  tags = {
    enviornment = "development"
  }

}
