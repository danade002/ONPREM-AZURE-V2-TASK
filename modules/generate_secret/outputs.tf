output "generated_secret_id" {
  description = "ID of the generated secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.generated_secret.id
}

output "generated_secret_name" {
  description = "Name of the generated secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.generated_secret.name
}
