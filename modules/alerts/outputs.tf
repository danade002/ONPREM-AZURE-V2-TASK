output "action_group_id" {
  description = "The ID of the Action Group used for alerts."
  value       = azurerm_monitor_action_group.monitor_action_group.id
}

output "http_server_errors_alert_id" {
  description = "The ID of the HTTP Server Errors Metric Alert."
  value       = azurerm_monitor_metric_alert.http_server_errors.id
}

output "app_service_downtime_alert_id" {
  description = "The ID of the App Service Downtime Metric Alert."
  value       = azurerm_monitor_metric_alert.app_service_downtime.id
}

output "linux_vm_downtime_alert_id" {
  description = "The ID of the Linux VM Downtime Metric Alert."
  value       = azurerm_monitor_metric_alert.linux_vm_downtime.id
}

output "postgres_deadlocks_alert_id" {
  description = "The ID of the PostgreSQL Deadlocks Metric Alert."
  value       = azurerm_monitor_metric_alert.postgres_deadlocks.id
}

output "postgres_slow_queries_alert_id" {
  description = "The ID of the PostgreSQL Slow Queries Metric Alert."
  value       = azurerm_monitor_metric_alert.postgres_slow_queries.id
}

output "slow_response_times_alert_id" {
  description = "The ID of the Slow Response Times Metric Alert."
  value       = azurerm_monitor_metric_alert.slow_response_times.id
}
