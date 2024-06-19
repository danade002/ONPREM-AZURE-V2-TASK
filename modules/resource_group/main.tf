data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

resource "azurerm_resource_group" "example" {
  count    = length(data.azurerm_resource_group.existing.id) == 0 ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}