data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_resource_group" "rg-new" {
  count    = length(data.azurerm_resource_group.rg.id) == 0 ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}



