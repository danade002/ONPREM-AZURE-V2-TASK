resource "azurerm_static_web_app" "static_site" {
  name                = var.static_site_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_tier = "Standard"
  sku_size = "Standard"

  app_settings = {
    "property1" = "value1"
  }
}


