output "admin_login_secret_id" {
  description = "The ID of the administrator login secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.admin_login[0].id
}

output "admin_login_password_secret_id" {
  description = "The ID of the administrator login password secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.admin_login_password[0].id
}

output "generated_secret_id" {
  description = "The ID of the generated secret in Azure Key Vault"
  value       = azurerm_key_vault_secret.generated_secret[0].id
}

output "existing_secret_value" {
  description = "The value of the existing secret in Azure Key Vault"
  value       = data.azurerm_key_vault_secret.existing[0].value
}
