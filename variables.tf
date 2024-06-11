
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


variable "network_interface_id" {
  description = "The ID of the network interface"
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

# Storage Account
variable "storage_account_name" {
  description = "The name of the blob storage account"
  type        = string
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

# General Resources
variable "location" {
  description = "The location of the resources"
  type        = string
}
 
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "domain_name" {
  description = "The root domain name"
  type        = string
}

variable "subdomain_name" {
  description = "The subdomain name"
  type        = string
}

variable "machine_ip" {
  description = "The IP address of the machine"
  type        = string
}

# Key Vault
variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "certificate_name" {
  description = "The name of the certificate."
  type        = string
}

# variable "certificate_dns_names" {
#   description = "List of DNS names for the certificate."
#   type        = list(string)
# }

variable "certificate_permissions" {
  description = "List of certificate permissions for the Key Vault."
  type        = list(string)
  default = [
    "Create",
    "Delete",
    "DeleteIssuers",
    "Get",
    "GetIssuers",
    "Import",
    "List",
    "ListIssuers",
    "ManageContacts",
    "ManageIssuers",
    "Purge",
    "SetIssuers",
    "Update",
  ]
}

variable "key_permissions" {
  description = "List of key permissions for the Key Vault."
  type        = list(string)
  default = [
    "Backup",
    "Create",
    "Decrypt",
    "Delete",
    "Encrypt",
    "Get",
    "Import",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Sign",
    "UnwrapKey",
    "Update",
    "Verify",
    "WrapKey",
  ]
}

variable "secret_permissions" {
  description = "List of secret permissions for the Key Vault."
  type        = list(string)
  default = [
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set",
  ]
}

# App Service Variables
variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}


variable "dns_zone_id" {
  description = "The ID of the DNS zone"
  type        = string
  
}

variable "certificate_uri" {
  description = "The URI of the certificate"
  type        = string
  
}

variable "app_service_url" {
  description = "The default URL of the App Service"
  type        = string
  
}
variable "custom_hostname_binding_id" {
  description = "The hostname of the App Service"
  type        = string
  
}

# variable "admin_ssh_key" {
#   description = "The admin SSH key for the Linux virtual machine"
#   type        = string
  
# }

