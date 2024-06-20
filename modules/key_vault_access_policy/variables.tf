variable "key_vault_id" {
  description = "The ID of the Key Vault"
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

variable "key_permissions" {
  description = "List of key permissions"
  type        = list(string)
}

variable "secret_permissions" {
  description = "List of secret permissions"
  type        = list(string)
}
