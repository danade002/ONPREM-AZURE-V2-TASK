resource "azurerm_resource_group" "new_rg" {
  count    = var.use_existing ? 0 : 1
  name     = var.new_name
  location = var.location
}

data "azurerm_resource_group" "existing_rg" {
  count = var.use_existing ? 1 : 0
  name  = var.existing_name
}

locals {
  resource_group_name = var.use_existing ? data.azurerm_resource_group.existing_rg[0].name : azurerm_resource_group.new_rg[0].name
}
