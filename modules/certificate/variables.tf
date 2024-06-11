variable "name" {
  description = "The name of the certificate."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault."
  type        = string
}

variable "dns_names" {
  description = "List of DNS names for the certificate."
  type        = list(string)
}

variable "certificate_name" {
  description = "The name of the certificate."
  type        = string
  
}