resource "azurerm_key_vault" "key_vault" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name
  tenant_id = var.tenant_id

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
