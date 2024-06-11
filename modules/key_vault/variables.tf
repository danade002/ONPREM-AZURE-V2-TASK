# modules/keyvault/variables.tf
variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "certificate_name" {
  description = "The name of the certificate"
  type        = string
}

variable "dns_zone_name" {
  description = "The DNS zone name"
  type        = string
}

variable "certificate_uri" {
  description = "The URI of the certificate"
  type        = string
  
}
