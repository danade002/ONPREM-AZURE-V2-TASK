variable "location" {
  description = "Location of the PostgreSQL server"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "server_name" {
  description = "Name of the PostgreSQL server"
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault"
}

variable "administrator_login_secret_name" {
  description = "Name of the secret in Azure Key Vault for PostgreSQL server administrator login"
}

variable "administrator_login_password_secret_name" {
  description = "Name of the secret in Azure Key Vault for PostgreSQL server administrator password"
}

variable "databases" {
  description = "List of databases to create on the PostgreSQL server"
  type        = list(string)
  
}