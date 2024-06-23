resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
}

resource "azurerm_key_vault_secret" "admin_login" {
  name         = "administrator-login"
  value        = var.administrator_login
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "administrator-login-password"
  value        = var.administrator_login_password
  key_vault_id = azurerm_key_vault.key_vault.id
}
