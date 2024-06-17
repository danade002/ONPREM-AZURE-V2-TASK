resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
}

data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}