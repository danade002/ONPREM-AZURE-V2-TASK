variable "name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "enabled_for_disk_encryption" {
  description = "Is disk encryption enabled?"
  type        = bool
  default     = true
}


variable "soft_delete_retention_days" {
  description = "Number of days to retain soft deleted items"
  type        = number
}

variable "purge_protection_enabled" {
  description = "Is purge protection enabled?"
  type        = bool
  default     = false
}

variable "sku_name" {
  description = "The SKU name"
  type        = string
  default     = "standard"
}



variable "key_permissions" {
  description = "Key permissions"
  type        = list(string)
  default     = ["Get"]
}

variable "secret_permissions" {
  description = "Secret permissions"
  type        = list(string)
  default     = ["Get"]
}

variable "storage_permissions" {
  description = "Storage permissions"
  type        = list(string)
  default     = ["Get"]
}


variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
  
}

variable "administrator_login" {
  description = "The administrator login"
  type        = string
}


  variable "administrator_login_password" {
    description = "The administrator login password"
    type        = string
  
}