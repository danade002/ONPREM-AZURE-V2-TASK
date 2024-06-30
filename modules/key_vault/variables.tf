variable "key_vault_name" {
  type        = string
  description = "The name of the Key Vault"
}

variable "location" {
  type        = string
  description = "The Azure region where the Key Vault will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "use_existing_secret" {
  type    = bool
  
}

variable "key_vault_id" {
  type = string
}

variable "administrator_login_value" {
  type    = string
  
}

variable "administrator_login_password_value" {
  type    = string
  
}


variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days to retain deleted keys"
  
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Enable or disable purge protection for the Key Vault"
  
}

variable "sku_name" {
  type        = string
  description = "The SKU name for the Key Vault"
  default     = "standard"
  
}

variable "generate_secret" {
  type        = bool
  description = "Flag to generate a new secret in Key Vault"
  
}

variable "use_generate_secret" {
  type        = bool
  description = "Flag to generate a new secret in Key Vault" 
}

variable "existing_secret_name" {
  type        = string
  description = "Name of the existing secret in Key Vault"
  
}

variable "administrator_login_password" {
  type        = string
  description = "Administrator login name"
  
}

variable "administrator_login" {
  type        = string
  description = "Administrator login password"
  
}

variable "use_admin_credentials" {
  type        = bool
  description = "Flag to use provided admin credentials"
  
}
