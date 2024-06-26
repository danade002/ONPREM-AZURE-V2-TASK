output "admin_login_secret_id" {
  value = azurerm_key_vault_secret.admin_login_secret[0].id
  description = "ID of the Key Vault secret for admin login"

}

output "admin_password_secret_id" {
  value = azurerm_key_vault_secret.administrator-login-password_secret[0].id
  description = "ID of the Key Vault secret for admin password"
  
}
