resource "azurerm_key_vault_secret" "admin_login_secret" {
  count       = var.use_admin_credentials ? 1 : 0
  name        = "administrator-login"
  value       = var.admin_login
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "admin_password_secret" {
  count       = var.use_admin_credentials ? 1 : 0
  name        = "administrator-login-password"
  value       = var.admin_password
  key_vault_id = var.key_vault_id
}