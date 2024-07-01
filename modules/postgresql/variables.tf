variable "location" {
  description = "Location of the PostgreSQL server"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "server_name" {
  description = "Name of the PostgreSQL server"
}

variable "administrator_login_secret_name" {
  description = "Name of the administrator login secret"
  type        = string
}

variable "administrator_login_password_secret_name" {
  description = "Name of the administrator login password secret"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}


variable "databases" {
  description = "List of databases to create on the PostgreSQL server"
  type        = list(string)
  
}