variable "server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "location" {
  description = "The location of the PostgreSQL server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "databases" {
  description = "The list of PostgreSQL databases to create"
  type        = list(string)
}

variable "administrator_login" {
  description = "The administrator login for the PostgreSQL server"
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the PostgreSQL server"
  type        = string
}

variable "postgresql_server_administrator_login" {
  description = "The administrator login for the PostgreSQL server"
  type        = string
  
}

variable "postgresql_server_administrator_login_password" {
  description = "The administrator login password for the PostgreSQL server"
  type        = string
  
}

variable "postgresql_server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
  
}