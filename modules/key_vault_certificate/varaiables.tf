variable "certificate_name" {
  description = "The name of the Key Vault Certificate"
  type        = string
}

variable "certificate_password" {
  description = "The password for the certificate file"
  type        = string
  sensitive   = true
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

variable "certificate_uri" {
  description = "The URI of the certificate in the Key Vault"
  type        = string
  
}

variable "thumbprint" {
  description = "The thumbprint of the certificate stored in Azure Key Vault"
  type        = string
  
}