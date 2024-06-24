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

variable "sku_name" {
  description = "The name of the SKU"
  type        = string
  
}

variable "storage_mb" {
  description = "The storage capacity of the PostgreSQL server"
  type        = number
  
}

variable "charset" {
  description = "The charset of the PostgreSQL server"
  type        = string
  
}

variable "collation" {
  description = "The collation of the PostgreSQL server"
  type        = string
  
}

variable "version" {
  description = "The version of the PostgreSQL server"
  type        = string
  
}

variable "ssl_enforcement_enabled" {
  description = "Enable SSL enforcement for the PostgreSQL server"
  type        = bool
  
}