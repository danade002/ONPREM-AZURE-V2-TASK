resource "azurerm_key_vault_secret" "existing_secret" {
  count = var.option == 2 ? 1 : 0

  name         = "existing-secret"
  value        = "your_existing_value"  # Replace with the actual existing secret value
  key_vault_id = module.existing_keyvault.key_vault_id
}

resource "azurerm_key_vault_secret" "new_secret" {
  count = var.option == 3 ? 1 : 0

  name         = "new-secret"
  value        = "generated_value"  # Replace with your generated secret value logic
  key_vault_id = module.existing_keyvault.key_vault_id
}

resource "azurerm_key_vault_secret" "admin_credentials" {
  count = var.option == 1 ? 1 : 0

  name         = "admin-credentials"
  value        = jsonencode({
    username = var.admin_username,
    password = var.admin_password
  })
  key_vault_id = module.existing_keyvault.key_vault_id
}