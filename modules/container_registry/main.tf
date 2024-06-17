resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}


data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}

