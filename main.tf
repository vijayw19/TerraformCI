terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "st-rg-001"
  location = "East US"

}

/*module "amvistorageaccounts" {
  source              = "app.terraform.io/amviorg/amvistorageaccounts/azurerm"
  version             = "1.0.0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = "Production"
  storageaccountname  = "amvisitstgaccount"
}*/

module "amvistorageaccounts" {
  source              = "github.com/AmviTFModules/terraform-azurerm-amvistorageaccounts"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = "Production"
  storageaccountname  = "amvisitstgaccount"
}


