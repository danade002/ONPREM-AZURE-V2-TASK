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

variable "administrator-login" {
  description = "The administrator username of the PostgreSQL server"
  type        = string
  
}

variable "administrator-login-password" {
  description = "The administrator password of the PostgreSQL server"
  type        = string
  
}