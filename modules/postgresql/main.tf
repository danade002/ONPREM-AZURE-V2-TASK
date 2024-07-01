data "azurerm_key_vault_secret" "administrator_login_secret" {
  name         = var.administrator-login-password-secret-name
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "administrator_login_password_secret" {
  name         = var.administrator-login-password-secret-name
  key_vault_id = var.key_vault_id
}

resource "azurerm_postgresql_server" "server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  administrator_login          = data.azurerm_key_vault_secret.administrator-login-secret.value
  administrator_login_password = data.azurerm_key_vault_secret.administrator-login-password-secret.value
  sku_name                     = "B_Gen5_1"
  storage_mb                   = 5120
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "databases" {
  count               = length(var.databases)
  name                = var.databases[count.index]
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

