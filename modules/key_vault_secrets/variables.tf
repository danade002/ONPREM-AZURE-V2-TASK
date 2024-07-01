variable "use_admin_credentials" {
  description = "Whether to use provided administrator credentials"
  type        = bool

}

variable "administrator_login" {
  description = "Administrator login name"
  type        = string
  
}

variable "administrator_login_password" {
  description = "Administrator login password"
  type        = string
  
}

variable "use_existing_secret" {
  description = "Whether to use an existing secret from Key Vault"
  type        = bool

}

variable "existing_secret_name" {
  description = "Name of the existing secret in Key Vault"
  type        = string
  
}

variable "use_generate_secret" {
  description = "Whether to generate a new secret and store it in Key Vault"
  type        = bool
  
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
  type        = string
  
}
