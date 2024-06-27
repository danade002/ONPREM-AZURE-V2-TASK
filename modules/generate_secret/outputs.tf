output "generated_secret_id" {
  description = "ID of the generated secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.generated_secret[*].id  # Access all IDs using splat expression
}

output "generated_secret_name" {
  description = "Name of the generated secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.generated_secret[*].name  # Access all names using splat expression
}
