variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The location of the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for the Key Vault."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name to store in the Key Vault."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password to store in the Key Vault."
  type        = string
}

variable "sku_name" {
  
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain soft deleted keys."
  type        = number
  
}