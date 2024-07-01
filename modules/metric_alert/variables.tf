variable "name" {
  description = "The name of the alert rule"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "scopes" {
  description = "The scopes to apply the alert rule to"
  type        = list(string)
}

variable "description" {
  description = "The description of the alert rule"
  type        = string
}

variable "criteria" {
  description = "List of criteria for the alert rule"
  type        = list(object({
    metric_name      = string
    metric_namespace = string
    aggregation      = string
    operator         = string
    threshold        = number
  }))
}

variable "action_group_id" {
  description = "The ID of the action group"
  type        = string
}
