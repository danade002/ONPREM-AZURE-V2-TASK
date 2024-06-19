resource "azurerm_resource_group" "rg" {
  count    = var.create ? 1 : 0
  name     = var.name
  location = var.location
}