# ./modules/key_vault_secrets/variables.tf

variable "key_vault_id" {
  description = "The ID of the Key Vault."
  type        = string
}

variable "use_existing_secret" {
  description = "Whether to use an existing secret."
  type        = bool
}

variable "use_admin_credentials" {
  description = "Whether to use provided admin credentials."
  type        = bool
}

variable "administrator_login" {
  description = "The admin login name."
  type        = string
  default     = ""
}

variable "administrator_login_password" {
  description = "The admin login password."
  type        = string
  default     = ""
}

variable "existing_secret_name" {
  description = "The name of the existing secret."
  type        = string
  default     = ""
}

variable "use_generate_secret" {
  description = "Whether to generate a new secret."
  type        = bool
}
