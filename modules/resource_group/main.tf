# resource "azurerm_resource_group" "rg" {
#   count    = var.create_new_resource_group || !var.resource_group_exists ? 1 : 0
#   name     = var.resource_group_name
#   location = var.location
# }

# Check if the resource group exists
data "azurerm_resource_group" "existing_rg" {
  name  = var.resource_group_name
  count = var.create_new_resource_group ? 0 : 1
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_new_resource_group || !length(data.azurerm_resource_group.existing_rg) > 0 ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}