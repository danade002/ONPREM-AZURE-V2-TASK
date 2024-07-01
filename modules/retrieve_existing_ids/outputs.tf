output "app_service_id" {
  value = data.azurerm_app_service.Insaitstaticwebapp123.id
}

output "vm_id" {
  value = data.azurerm_virtual_machine.insait-vm123.id
}

output "postgresql_id" {
  value = data.azurerm_postgresql_server.insaitpgserver123.id
}