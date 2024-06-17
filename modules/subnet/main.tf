resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.address_prefix]
}


data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}