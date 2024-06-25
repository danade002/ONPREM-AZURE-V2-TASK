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

variable "tenant_id" {
  type        = string
  description = "The tenant ID for the Azure subscription"
}

variable "administrator_login" {
  type        = string
  description = "Administrator login for the database"
}

variable "administrator_login_password" {
  type        = string
  description = "Administrator login password for the database"
  sensitive   = true
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

variable "existing_secret" {
  description = "Name of the pre-existing secret in Key Vault"
}

variable "new_secret_name" {
  description = "Name of the new secret to create in Key Vault"
}

variable "new_secret_value" {
  description = "Value of the new secret to create in Key Vault"
}

variable "use_existing_secret" {
  description = "Set to true if you want to use an existing secret, false to create a new one"
  default     = true
}

variable "key_vault_id" {
  description = "The ID of the Key Vault"
  type        = string
  
}