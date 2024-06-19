resource "azurerm_resource_group" "rg" {
  count    = var.count
  name     = var.resource_group_name
  location = var.location
}