output "app_service_name" {
  description = "The name of the App Service"
  value       = azurerm_app_service.example.name
}

output "app_service_url" {
  description = "The default URL of the App Service"
  value       = azurerm_app_service.example.default_site_hostname
}
