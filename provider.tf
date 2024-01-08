terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  backend "azurerm" {
    
    resource_group_name  = "rg-backend"
    storage_account_name = "amvidevstgaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }


}


provider "azurerm" {
  skip_provider_registration = true
  features {}

}