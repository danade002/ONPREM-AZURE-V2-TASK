resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name                        = var.name
  target_resource_id          = var.target_resource_id
  log_analytics_workspace_id  = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = var.log_categories
    content {
      category = log.value
      enabled  = true
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories
    content {
      category = metric.value
      enabled  = true
    }
  }
}
