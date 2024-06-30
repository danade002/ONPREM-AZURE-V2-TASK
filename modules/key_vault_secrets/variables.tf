variable "key_vault_id" {
  description = "ID of the Azure Key Vault where secrets will be stored."
  type        = string
}

variable "use_admin_credentials" {
  description = "Flag to indicate if administrator login credentials should be used."
  type        = bool
  
}

variable "administrator_login" {
  description = "Administrator login name."
  type        = string
  
}

variable "administrator_login_password" {
  description = "Administrator login password."
  type        = string
  
}

variable "existing_secret_name" {
  description = "Name of the existing secret in Azure Key Vault."
  type        = string

}

variable "use_existing_secret" {
  description = "Flag to indicate if an existing secret should be used from Azure Key Vault."
  type        = bool
  
}

variable "use_generate_secret" {
  description = "Flag to indicate if a new secret should be generated."
  type        = bool
  
}

variable "secrets" {
  description = "Map of additional secrets to be stored in Azure Key Vault."
  type        = map(object({
    value = string
  }))
  
}
