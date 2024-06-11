resource "azurerm_app_service_plan" "app_service" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service.id
}

resource "azurerm_app_service_custom_hostname_binding" "app_service_custom_hostname_binding" {
  hostname            = var.domain_name
  app_service_name    = azurerm_app_service.app_service.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_app_service_managed_certificate" "certificate" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.certificate.id
  
}
