resource "random_password" "generated_password" {
  length            = 20
  special           = true
  override_special  = "_%@"
  keepers = {
    generate = var.use_generate_secret
  }
}

data "azurerm_key_vault_secret" "existing" {
  name         = var.existing_secret_name
  key_vault_id = var.key_vault_id
  count        = var.use_existing_secret ? 1 : 0
}

resource "azurerm_key_vault_secret" "admin_login" {
  count = var.use_admin_credentials ? 1 : 0

  name         = "administrator-login"
  value        = var.administrator_login
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "admin_login_password" {
  count = var.use_admin_credentials ? 1 : 0

  name         = "administrator-login-password"
  value        = var.administrator_login_password
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "generated_secret" {
  count       = var.use_generate_secret ? 1 : 0
  name        = "generated-secret"
  value       = random_password.generated_password.result
  key_vault_id = var.key_vault_id
}