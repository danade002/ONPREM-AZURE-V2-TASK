resource "random_password" "administrator-login-password" {
  count  = var.use_generate_secret ? 1 : 0
  length = var.generate_secret_length
  special = var.generate_secret_special
}

resource "azurerm_key_vault_secret" "administrator-login-password_secret" {
  count       = var.use_generate_secret ? 1 : 0
  name        = "administrator-login-password"
  value       = random_password.administrator-login-password[0].result
  key_vault_id = var.key_vault_id
}
