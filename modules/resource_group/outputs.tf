output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}
