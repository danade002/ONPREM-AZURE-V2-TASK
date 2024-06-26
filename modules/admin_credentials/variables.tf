variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
}

variable "administrator-login" {
  description = "Administrator login name"
}

variable "administrator-login-password" {
  description = "Administrator login password"
}

variable "use_admin_credentials" {
  description = "Enable the module to create secrets using admin credentials"
  type        = bool
}
