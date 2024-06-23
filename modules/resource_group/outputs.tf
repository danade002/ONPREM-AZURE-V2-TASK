output "location" {
  value = var.location
}
output "resource_group_name" {
  value = var.resource_group_name
}

output "existing_rg_id" {
  description = "The ID of the existing Azure Resource Group."
  value       = try(azurerm_resource_group.existing_rg[0].id, null)
}