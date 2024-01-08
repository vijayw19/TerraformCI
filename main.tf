resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
}


locals {
  env_tags = {
    dev  = "development"
    stg  = "staging"
    prod = "production"
  }
}

locals {
  name = "amvisitstgaccount"
}


resource "azurerm_storage_account" "storage" {
  for_each = var.resource_groups

  //depends_on               = [azurerm_resource_group.rg]
  //name                     = local.env_tags.dev != "production" ? "amvinonprodaccount" : "amviprodaccount"
  name                     = local.name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.tags != "dev" ? "Standard" : "Premium"
  account_replication_type = "GRS"
  tags = {
    environment = "development"
  }
  lifecycle {
    create_before_destroy = true
  }
}
