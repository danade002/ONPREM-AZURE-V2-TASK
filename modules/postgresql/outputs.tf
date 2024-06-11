
output "database_names" {
  value = azurerm_postgresql_database.databases
}

output "postgresql_server_name" {
  value = azurerm_postgresql_server.server.name
}


output "server_name" {
  description = "The name of the PostgreSQL server"
  value       =  azurerm_postgresql_server.server.name
}

output "administrator_login" {
  description = "The administrator login for the PostgreSQL server"
  value       = azurerm_postgresql_server.server.administrator_login
}