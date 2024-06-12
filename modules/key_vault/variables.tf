variable "name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID"
  type        = string
}

variable "object_id" {
  description = "The object ID"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted key vaults"
  type        = number
}

variable "certificate_name" {
  description = "The name of the Key Vault Certificate"
  type        = string
  
}

variable "certificate_path" {
  description = "The path to the certificate file"
  type        = string
}

variable "certificate_password" {
  description = "The password for the certificate file"
  type        = string
}
variable "certificate_uri" {
  description = "The URI of the certificate in the Key Vault"
  type        = string
  
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
  
}
variable "id" {
  description = "The ID of the Key Vault"
  type        = string
  
}