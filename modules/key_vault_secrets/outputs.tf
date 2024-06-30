output "admin_login_secret_id" {
  value = azurerm_key_vault_secret.admin_login[*].id
}

output "admin_login_password_secret_id" {
  value = azurerm_key_vault_secret.admin_login_password[*].id
}
