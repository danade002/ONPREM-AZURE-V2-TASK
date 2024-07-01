variable "name" {
  description = "The name of the diagnostic setting"
  type        = string
}

variable "target_resource_id" {
  description = "The ID of the target resource"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace"
  type        = string
}

variable "log_categories" {
  description = "List of log categories to enable"
  type        = list(string)
}

variable "metric_categories" {
  description = "List of metric categories to enable"
  type        = list(string)
}
