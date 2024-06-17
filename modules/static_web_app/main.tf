resource "azurerm_static_web_app" "static_site" {
  name                = var.static_site_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name

  sku_tier = "Standard"
  sku_size = "Standard"

  app_settings = {
    "property1" = "value1"
  }
}


data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}
