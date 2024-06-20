output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.key_vault.name
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.key_vault.vault_uri
}

output "admin_login_secret_id" {
  description = "The ID of the administrator login secret"
  value       = azurerm_key_vault_secret.admin_login.id
}

output "admin_password_secret_id" {
  description = "The ID of the administrator login password secret"
  value       = azurerm_key_vault_secret.admin_password.id
}

output "id" {
  value = azurerm_key_vault.key_vault.id
}

