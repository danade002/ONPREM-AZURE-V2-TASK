output "key_vault_id" {
  value = azurerm_key_vault.key_vault.id
}

output "admin_login_secret_id" {
  value = azurerm_key_vault_secret.admin_login.id
}

output "admin_password_secret_id" {
  value = azurerm_key_vault_secret.admin_password.id
}