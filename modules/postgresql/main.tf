resource "azurerm_postgresql_server" "server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name = var.resource_group_name
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  version                      = var.version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
}

resource "azurerm_postgresql_database" "databases" {
  count               = length(var.databases)
  name                = var.databases[count.index]
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  charset             = var.charset
  collation           = var.collation
}

