resource "azurerm_monitor_metric_alert" "monitor_metric_alert" {
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  description         = var.description

  dynamic "criteria" {
    for_each = var.criteria
    content {
      metric_name        = criteria.value.metric_name
      metric_namespace   = criteria.value.metric_namespace
      aggregation        = criteria.value.aggregation
      operator           = criteria.value.operator
      threshold          = criteria.value.threshold
    }
  }

  action {
    action_group_id = var.action_group_id
  }
}
