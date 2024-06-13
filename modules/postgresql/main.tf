

resource "azurerm_postgresql_server" "server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  sku_name   = "B_Gen5_2"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  
  public_network_access_enabled = false
  ssl_enforcement_enabled       = true
}


  


resource "azurerm_postgresql_database" "databases" {
  count               = length(var.databases)
  name                = var.databases[count.index]
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
