
# Output the Key Vault name
output "key_vault_name" {
  description = "The name of the Azure Key Vault"
  value       = azurerm_key_vault.example.name
}

# Output the certificate name
output "certificate_name" {
  description = "The name of the certificate in the Key Vault"
  value       = azurerm_key_vault_certificate.example.name
}

# Output the Key Vault URI for the certificate
output "certificate_uri" {
  description = "The URI of the certificate in the Key Vault"
  value       = azurerm_key_vault_certificate.example.id
}
