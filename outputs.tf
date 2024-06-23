output "existing_rg_id" {
  description = "The ID of the existing resource group"
  value       = azurerm_resource_group.existing_rg.id
}


output "existing_rg_id_from_module" {
  value = module.resource_group_module.existing_rg_id
}
