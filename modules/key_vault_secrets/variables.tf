variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
}

variable "secrets" {
  description = "Map of secrets to manage in Azure Key Vault"
  type        = map(string)
  default     = {}
}