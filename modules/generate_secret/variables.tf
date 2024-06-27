variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
}

variable "generate_secret_length" {
  description = "Length of generated password"
  default     = 16
}

variable "generate_secret_special" {
  description = "Include special characters in generated password"
  default     = true
}

variable "use_generate_secret" {
  description = "Enable the module to generate a new secret"
  type        = bool
}

variable "secret_name" {
  description = "Name of the secret to create"
  
}