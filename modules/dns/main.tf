resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
}


data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}