variable "name" {
  description = "The name of the action group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "short_name" {
  description = "The short name of the action group"
  type        = string
}

variable "email_receivers" {
  description = "List of email receivers"
  type        = list(object({
    name          = string
    email_address = string
  }))
}
