variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "count" {
  description = "The number of resource groups to create"
  type        = number

  
}