variable "name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The location of the resource group"
}

variable "create" {
  type        = bool
  description = "Flag to indicate whether to create the resource group"
  default     = true
}