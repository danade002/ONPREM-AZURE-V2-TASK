variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
}

variable "admin_login" {
  description = "Administrator login name"
}

variable "admin_password" {
  description = "Administrator login password"
}

variable "use_admin_credentials" {
  description = "Enable the module to create secrets using admin credentials"
  type        = bool
}
