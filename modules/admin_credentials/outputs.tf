output "admin_password_secret_id" {
  value       = azurerm_key_vault_secret.administrator-login-password.id
  description = "ID of the Key Vault secret for admin password"
}
