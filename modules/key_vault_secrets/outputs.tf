output "admin_login_secret_id" {
  description = "The ID of the administrator login secret in Azure Key Vault."
  value       = azurerm_key_vault_secret.admin_login.id
}

output "admin_login_password_secret_id" {
  description = "The ID of the administrator login password secret in Azure Key Vault."
  value       = azurerm_key_vault_secret.admin_login_password.id
}

output "generated_secrets" {
  description = "Generated secrets stored in Azure Key Vault."
  value       = azurerm_key_vault_secret.secrets
}
