output "static_site_url" {
  value = {
    url = azurerm_static_web_app.static_site.default_host_name
  }
}
