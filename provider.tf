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