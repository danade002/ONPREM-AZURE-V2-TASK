resource "azurerm_postgresql_server" "server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
  sku_name                     = "B_Gen5_1"
  storage_mb                   = 5120
  administrator_login          = "danielinsait"
  administrator_login_password = "Daniel@1234"
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "databases" {
  count               = length(var.databases)
  name                = var.databases[count.index]
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
  server_name         = azurerm_postgresql_server.server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}


data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}