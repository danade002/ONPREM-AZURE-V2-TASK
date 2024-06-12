
# Networking Variables
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

variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

# Virtual Machine Variables
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

# variable "admin_ssh_key" {
#   description = "The admin SSH key for the Linux virtual machine"
#   type        = string
# }

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
}

# Azure Container Registry (ACR) Variables
variable "registry_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

# PostgreSQL Server Variables
variable "pg_server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "pg_databases" {
  description = "The names of the PostgreSQL databases"
  type        = list(string)
}

# Storage Account Variables
variable "storage_account_name" {
  description = "The name of the blob storage account"
  type        = string
}

# Azure DNS Zone Variables
variable "dns_zone_name" {
  description = "The name of the Azure DNS zone"
  type        = string
}

# Container Group and Container Variables
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

# Static Web App Variables
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

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Domain and IP Variables
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

# Key Vault Variables
variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

# Certificate Variables
variable "certificate_name" {
  description = "The name of the certificate"
  type        = string
}

variable "certificate_path" {
  description = "The path to the certificate file"
  type        = string
}

variable "certificate_password" {
  description = "The password for the certificate file"
  type        = string
}

# Tenant ID
variable "tenant_id" {
  description = "The tenant ID for Azure"
  type        = string
}

variable "object_id" {
  description = "The object ID for Azure"
  type        = string
  
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  
}


variable "soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted key vaults"
  type        = number
  
}


variable "dns_names" {
  description = "The DNS names for the certificate"
  type        = list(string)

}

variable "subject" {
  description = "The subject name of the certificate"
  type        = string
}

variable "validity_in_months" {
  description = "The validity period of the certificate in months"
  type        = number

}

variable "id" {
  description = "The ID of the Key Vault"
  type        = string
  
}
variable "certificate_uri" {
  description = "The URI of the certificate in the Key Vault"
  type        = string
  
}