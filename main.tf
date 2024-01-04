

/* module "amviresourcegroups" {
  source = "github.com/AmviTFModules/terraform-azurerm-amvi-resource-group"

  name = var.rg_name

} */

resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

