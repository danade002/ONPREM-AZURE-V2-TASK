output "id" {
  description = "The ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.id
}

output "workspace_id" {
  description = "The Workspace ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.workspace_id
}

output "primary_shared_key" {
  description = "The Primary Shared Key of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.primary_shared_key
}
