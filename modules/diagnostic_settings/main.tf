resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = var.logs
    content {
      category = log.value.category
      enabled  = log.value.enabled

      retention_policy {
        enabled = log.value.retention_policy.enabled
      }
    }
  }

  dynamic "metric" {
    for_each = var.metrics
    content {
      category = metric.value.category
      enabled  = metric.value.enabled

      retention_policy {
        enabled = metric.value.retention_policy.enabled
      }
    }
  }
}
