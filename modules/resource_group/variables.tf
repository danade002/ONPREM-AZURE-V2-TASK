variable "use_existing" {
  description = "Boolean to determine if an existing resource group should be used"
  type        = bool
}

variable "existing_name" {
  description = "The name of the existing resource group (if any)"
  type        = string
  default     = ""
}

variable "new_name" {
  description = "The name of the new resource group to be created"
  type        = string
}

variable "location" {
  description = "The Azure location where the resource group will be created"
  type        = string
}