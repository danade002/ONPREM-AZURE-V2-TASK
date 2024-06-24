# resource "azurerm_monitor_action_group" "monitor_action_group" {
#   name                = var.name
#   resource_group_name = var.resource_group_name
#   short_name          = var.short_name

#   dynamic "email_receiver" {
#     for_each = var.email_receivers
#     content {
#       name          = email_receiver.value.name
#       email_address = email_receiver.value.email_address
#     }
#   }
# }

# resource "azurerm_monitor_metric_alert" "http_server_errors" {
#   name                = "http-server-errors"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.app_service_id]
#   description         = "Alert for HTTP 5xx server errors"
#   severity            = 2
#   frequency           = "PT1M"
#   window_size         = "PT5M"
#   criteria {
#     metric_namespace = "Microsoft.Web/sites"
#     metric_name      = "Http5xx"
#     aggregation      = "Total"
#     operator         = "GreaterThan"
#     threshold        = 10
#   }
#   action {
#     action_group_id = azurerm_monitor_action_group.monitor_action_group.id
#   }
# }

# resource "azurerm_monitor_metric_alert" "app_service_downtime" {
#   name                = "app-service-downtime"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.app_service_id]
#   description         = "Alert for app service downtime"
#   severity            = 2
#   frequency           = "PT1M"
#   window_size         = "PT5M"
#   criteria {
#     metric_namespace = "Microsoft.Web/sites"
#     metric_name      = "HttpAvailability"
#     aggregation      = "Average"
#     operator         = "LessThan"
#     threshold        = 90
#   }
#   action {
#     action_group_id = azurerm_monitor_action_group.monitor_action_group.id
#   }
# }

# resource "azurerm_monitor_metric_alert" "linux_vm_downtime" {
#   name                = "linux-vm-downtime"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.linux_vm_id]
#   description         = "Alert for Linux VM downtime"
#   severity            = 2
#   frequency           = "PT1M"
#   window_size         = "PT5M"
#   criteria {
#     metric_namespace = "Microsoft.Compute/virtualMachines"
#     metric_name      = "Availability"
#     aggregation      = "Average"
#     operator         = "LessThan"
#     threshold        = 90
#   }
#   action {
#     action_group_id = azurerm_monitor_action_group.monitor_action_group.id
#   }
# }

# resource "azurerm_monitor_metric_alert" "postgres_deadlocks" {
#   name                = "postgres-deadlocks"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.postgresql_server_id]
#   description         = "Alert for PostgreSQL deadlocks"
#   severity            = 2
#   frequency           = "PT1M"
#   window_size         = "PT5M"
#   criteria {
#     metric_namespace = "Microsoft.DBforPostgreSQL/servers"
#     metric_name      = "deadlocks"
#     aggregation      = "Total"
#     operator         = "GreaterThan"
#     threshold        = 1
#   }
#   action {
#     action_group_id = azurerm_monitor_action_group.monitor_action_group.id
#   }
# }

# resource "azurerm_monitor_metric_alert" "postgres_slow_queries" {
#   name                = "postgres-slow-queries"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.postgresql_server_id]
#   description         = "Alert for PostgreSQL slow queries"
#   severity            = 2
#   frequency           = "PT1M"
#   window_size         = "PT5M"
#   criteria {
#     metric_namespace = "Microsoft.DBforPostgreSQL/servers"
#     metric_name      = "QueryPerformanceInsight_avg_duration"
#     aggregation      = "Average"
#     operator         = "GreaterThan"
#     threshold        = 500
#   }
#   action {
#     action_group_id = azurerm_monitor_action_group.monitor_action_group.id
#   }
# }

# resource "azurerm_monitor_metric_alert" "slow_response_times" {
#   name                = "slow-response-times"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.application_insights_id]
#   description         = "Alert for slow response times"
#   severity            = 2
#   frequency           = "PT1M"
#   window_size         = "PT5M"
#   criteria {
#     metric_namespace = "microsoft.insights/components"
#     metric_name      = "requestDuration"
#     aggregation      = "Average"
#     operator         = "GreaterThan"
#     threshold        = 1000
#   }
#   action {
#     action_group_id = azurerm_monitor_action_group.monitor_action_group.id
#   }
# }
