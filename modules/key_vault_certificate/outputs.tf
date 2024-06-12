output "certificate_name" {
  value = var.certificate_name
}


output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = var.key_vault_id
}

output "certificate_uri" {
  description = "The URI of the certificate stored in Azure Key Vault"
  value       = var.certificate_uri
  
}

output "thumbprint" {
  description = "The thumbprint of the certificate stored in Azure Key Vault"
  value       = var.thumbprint
  
}

output "certificate_id" {
  value = var.certificate.id
}
