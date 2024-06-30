variable "key_vault_id" {
  description = "Key Vault ID"
  type        = string
}

variable "secrets" {
  description = "Map of secrets to be stored in the Key Vault"
  type        = map(object({
    value = string
  }))
}
