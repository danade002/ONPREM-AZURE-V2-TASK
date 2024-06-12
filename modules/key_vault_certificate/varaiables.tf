variable "certificate_name" {
  description = "The name of the Key Vault Certificate"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault"
  type        = string
}

variable "dns_names" {
  description = "The DNS names for the certificate"
  type        = list(string)
}

variable "subject" {
  description = "The subject name of the certificate"
  type        = string
}

variable "validity_in_months" {
  description = "The validity period of the certificate in months"
  type        = number
}
