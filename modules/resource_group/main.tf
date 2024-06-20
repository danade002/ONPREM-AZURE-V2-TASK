resource "azurerm_resource_group" "rg" {
  count    = var.create_new_resource_group || !var.resource_group_exists ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}