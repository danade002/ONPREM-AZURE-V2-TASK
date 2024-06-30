# Retrieve the current client configuration (tenant and object IDs)
data "azurerm_client_config" "current" {}

# Create secrets in Key Vault if not using existing secret
resource "azurerm_key_vault_secret" "admin_login" {
  count        = var.use_existing_secret ? 0 : 1
  name         = "administrator-login"
  value        = var.administrator_login_value
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "admin_login_password" {
  count        = var.use_existing_secret ? 0 : 1
  name         = "administrator-login-password"
  value        = var.administrator_login_password_value
  key_vault_id = azurerm_key_vault.key_vault.id
}

# Generate a random password if required
resource "random_password" "generated_password" {
  length            = 16
  special           = true
  override_special  = "_%@"
  keepers = {
    generate = var.use_generate_secret
  }
}

# Retrieve existing secret if specified
data "azurerm_key_vault_secret" "existing" {
  count       = var.use_existing_secret ? 1 : 0
  name        = var.existing_secret_name
  key_vault_id = azurerm_key_vault.key_vault.id
}

# Determine the final admin login password
locals {
  final_admin_login_password = var.use_admin_credentials ? var.administrator_login_password_value : (
    var.use_existing_secret ? data.azurerm_key_vault_secret.existing[0].value : random_password.generated_password.result
  )
}