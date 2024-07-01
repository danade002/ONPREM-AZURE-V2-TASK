output "database_names" {
  value = azurerm_postgresql_database.databases[*].name
}