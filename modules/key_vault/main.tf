data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = var.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = var.purge_protection_enabled
  soft_delete_retention_days  = var.soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "Backup",
      "Restore",
    ]
  }
}

resource "azurerm_key_vault_secret" "admin_login" {
  count = var.use_existing_secret ? 0 : 1

  name         = "administrator-login"
  value        = var.administrator_login_value
  key_vault_id = azurerm_key_vault.key_vault.id

}

resource "azurerm_key_vault_secret" "admin_login_password" {
  count = var.use_existing_secret ? 0 : 1

  name         = "administrator-login-password"
  value        = var.administrator_login_password_value
  key_vault_id = azurerm_key_vault.key_vault.id


}
