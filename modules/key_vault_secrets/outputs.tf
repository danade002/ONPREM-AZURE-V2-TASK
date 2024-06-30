
output "admin_login" {
  value = azurerm_key_vault_secret.admin_login.value
}

output "admin_login_password" {
  value = azurerm_key_vault_secret.admin_login_password.value
}
