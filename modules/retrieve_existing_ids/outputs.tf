output "app_service_id" {
  value = data.azurerm_app_service.example_app_service.id
}

output "vm_id" {
  value = data.azurerm_virtual_machine.example_vm.id
}

output "postgresql_id" {
  value = data.azurerm_postgresql_server.example_postgresql.id
}