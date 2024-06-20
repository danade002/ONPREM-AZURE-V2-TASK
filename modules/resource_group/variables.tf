variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "create_new_resource_group" {
  description = "Boolean flag to create a new resource group if true."
  type        = bool
  default     = false
}

variable "resource_group_exists" {
  description = "Boolean flag to check if the resource group already exists."
  type        = bool
  default     = false
}