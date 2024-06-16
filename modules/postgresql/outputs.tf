output "server_name" {
  value = azurerm_postgresql_server.server.name
}

output "database_names" {
  value = azurerm_postgresql_database.databases[*].name
}
