# modules/keyvault/variables.tf
variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "certificate_name" {
  description = "The name of the certificate"
  type        = string
}

variable "dns_zone_name" {
  description = "The DNS zone name"
  type        = string
}

variable "certificate_uri" {
  description = "The URI of the certificate"
  type        = string
  
}

variable "tenant_id" {
  description = "The tenant ID for the Key Vault"
  type        = string
}

variable "object_id" {
  description = "The object ID for the Key Vault access policy"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Key Vault"
  type        = string
  default     = "premium"
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain deleted secrets"
  type        = number
  default     = 7
}

variable "key_permissions" {
  description = "The key permissions for the Key Vault access policy"
  type        = list(string)
  default     = ["Create", "Get"]
}

variable "secret_permissions" {
  description = "The secret permissions for the Key Vault access policy"
  type        = list(string)
  default     = ["Set", "Get", "Delete", "Purge", "Recover"]
}


variable "key_vault_id" {
  description = "The ID of the Key Vault"
  type        = string
  
}