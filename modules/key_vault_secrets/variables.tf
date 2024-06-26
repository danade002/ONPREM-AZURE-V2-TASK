variable "admin_name" {
  description = "Admin username"
  type        = string
  default     = null
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  default     = null
}

variable "pre_existing_secret" {
  description = "Pre-existing KeyVault secret ID"
  type        = string
  default     = null
}

variable "key_vault_id" {
  description = "The ID of the KeyVault"
  type        = string
}