# Networking
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix of the subnet"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
}

# Virtual Machine
variable "vm_name" {
  description = "The name of the Linux virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the Linux virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Linux virtual machine"
  type        = string
}

# Azure Container Registry (ACR)
variable "registry_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

# PostgreSQL Server
variable "pg_server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "pg_databases" {
  description = "The names of the PostgreSQL databases"
  type        = list(string)
}

# Azure DNS Zone
variable "dns_zone_name" {
  description = "The name of the Azure DNS zone"
  type        = string
}

# Public IP and Load Balancer
variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

# Container Group and Container
variable "container_group_name" {
  description = "The name of the container group"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "image" {
  description = "The container image to deploy"
  type        = string
}

variable "cpu" {
  description = "The number of CPU cores for the container"
  type        = number
}

variable "memory" {
  description = "The amount of memory for the container in GB"
  type        = number
}

variable "port" {
  description = "The port to expose on the container"
  type        = number
}

# Static Web App
variable "static_site_name" {
  description = "The name of the static web app"
  type        = string
}

variable "app_name" {
  description = "The name of the static web app"
  type        = string
}

variable "source_code_path" {
  description = "The path to the source code for the static web app"
  type        = string
}

# General Variables
variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "create_new_resource_group" {
  description = "Flag to create a new resource group"
  type        = bool
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault where secrets will be stored."
  type        = string
}

variable "use_admin_credentials" {
  description = "Flag to indicate if administrator login credentials should be used."
  type        = bool
  
}

variable "administrator_login" {
  description = "Administrator login name."
  type        = string
  
}

variable "administrator_login_password" {
  description = "Administrator login password."
  type        = string
 
}

variable "key_vault_name" {
  type        = string
  description = "The name of the Key Vault"
  
}

variable "existing_secret_name" {
  description = "Name of the existing secret in Azure Key Vault."
  type        = string
  
}

variable "use_existing_secret" {
  description = "Flag to indicate if an existing secret should be used from Azure Key Vault."
  type        = bool
  
}

variable "use_generate_secret" {
  description = "Flag to indicate if a new secret should be generated."
  type        = bool
  
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "log_analytics_retention_days" {
  description = "The retention period in days for the Log Analytics Workspace"
  type        = number
}

variable "action_group_name" {
  description = "The name of the action group for alerts"
  type        = string
}

variable "action_group_short_name" {
  description = "The short name of the action group for alerts"
  type        = string
}

variable "email_receivers" {
  description = "A list of email receivers for alert notifications"
  type = list(object({
    name          = string
    email_address = string
  }))
}

variable "app_service_diagnostics_name" {
  description = "The name of the diagnostic setting for App Services"
  type        = string
}

variable "app_service_id" {
  description = "The ID of the App Service to apply diagnostics"
  type        = string
}

variable "app_service_log_categories" {
  description = "The log categories to collect for App Services"
  type        = list(string)
}

variable "app_service_metric_categories" {
  description = "The metric categories to collect for App Services"
  type        = list(string)
}

variable "vm_diagnostics_name" {
  description = "The name of the diagnostic setting for Virtual Machines"
  type        = string
}

variable "vm_id" {
  description = "The ID of the Virtual Machine to apply diagnostics"
  type        = string
}

variable "vm_log_categories" {
  description = "The log categories to collect for Virtual Machines"
  type        = list(string)
}

variable "vm_metric_categories" {
  description = "The metric categories to collect for Virtual Machines"
  type        = list(string)
}

variable "postgresql_diagnostics_name" {
  description = "The name of the diagnostic setting for PostgreSQL"
  type        = string
}

variable "postgresql_id" {
  description = "The ID of the PostgreSQL server to apply diagnostics"
  type        = string
}

variable "postgresql_log_categories" {
  description = "The log categories to collect for PostgreSQL"
  type        = list(string)
}

variable "postgresql_metric_categories" {
  description = "The metric categories to collect for PostgreSQL"
  type        = list(string)
}

variable "app_service_http_errors_alert_name" {
  description = "The name of the alert rule for App Service HTTP errors"
  type        = string
}

variable "app_service_downtime_alert_name" {
  description = "The name of the alert rule for App Service downtime"
  type        = string
}

variable "postgresql_deadlocks_alert_name" {
  description = "The name of the alert rule for PostgreSQL deadlocks"
  type        = string
}

variable "postgresql_slow_queries_alert_name" {
  description = "The name of the alert rule for PostgreSQL slow queries"
  type        = string
}

variable "alert_criteria" {
  description = "A list of criteria for defining alert rules"
  type        = list(object({
    name             = string
    scopes           = list(string)
    description      = string
    metric_name      = string
    metric_namespace = string
    aggregation      = string
    operator         = string
    threshold        = number
  }))
}
