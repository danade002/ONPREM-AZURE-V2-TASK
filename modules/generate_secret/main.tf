resource "random_password" "admin_password" {
  count           = var.use_generate_secret ? 1 : 0
  length          = var.generate_secret_length
  special         = var.generate_secret_special
  override_special = "_%@"
}

resource "azurerm_key_vault_secret" "admin_password_secret" {
  count       = var.use_generate_secret ? 1 : 0
  name        = "administrator-login-password"
  value       = random_password.admin_password[count.index].result
  key_vault_id = var.key_vault_id
}