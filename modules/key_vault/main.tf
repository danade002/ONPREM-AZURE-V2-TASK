
resource "azurerm_key_vault" "danielinsaitvault12" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions    = var.key_permissions
    secret_permissions = var.secret_permissions
  }
}

resource "azurerm_key_vault_secret" "admin_login" {
  name         = "administrator-login"
  value        = var.administrator_login
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "administrator-password"
  value        = var.administrator_login_password
  key_vault_id = azurerm_key_vault.example.id
}

output "key_vault_id" {
  value = azurerm_key_vault.example.id
}

output "admin_login_secret_id" {
  value = azurerm_key_vault_secret.admin_login.id
}

output "admin_password_secret_id" {
  value = azurerm_key_vault_secret.admin_password.id
}



data "azurerm_client_config" "current" {}


