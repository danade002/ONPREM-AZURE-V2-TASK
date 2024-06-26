resource "random_password" "secret" {
  count  = var.admin_name == null && var.pre_existing_secret == null ? 1 : 0
  length = 16
  special = true
}

resource "azurerm_key_vault_secret" "new_secret" {
  count        = var.admin_name == null && var.pre_existing_secret == null ? 1 : 0
  name         = "new-secret"
  value        = random_password.secret[0].result
  key_vault_id = var.key_vault_id
}