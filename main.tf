# Terraform configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "1.13.1"
    }
  }
  backend "azurerm" {
    container_name = "tfstate"
    key            = "terraform.tfstate"
  }
}

# Azure providers
provider "azurerm" {
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

provider "azapi" {}

provider "azuread" {}

# Current client configuration
data "azurerm_client_config" "current" {}

# Check if resource group exists
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Service principal data
data "azuread_service_principal" "service_principal" {
  display_name = var.service_principal_display_name
}

# Resource Group (Conditional creation)
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location

  # Only create the resource group if it does not already exist
  count = length(data.azurerm_resource_group.existing_rg.id) == 0 ? 1 : 0
}

# Networking
module "virtual_network" {
  source              = "./modules/virtual_network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
}

module "subnet" {
  source              = "./modules/subnet"
  resource_group_name = var.resource_group_name
  vnet_name           = module.virtual_network.vnet_name
  subnet_name         = var.subnet_name
  address_prefix      = var.subnet_address_prefix
}

# Virtual Machine
module "linux_virtual_machine" {
  source               = "./modules/linux_virtual_machine"
  resource_group_name  = var.resource_group_name
  location             = var.location
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  subnet_id            = module.subnet.subnet_id
  admin_username       = var.admin_username
  network_interface_id = var.network_interface_id
}

# Container Registry
module "container_registry" {
  source              = "./modules/container_registry"
  resource_group_name = var.resource_group_name
  location            = var.location
  registry_name       = var.registry_name
}

# PostgreSQL Server
module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.pg_server_name
  databases           = var.pg_databases
}

# DNS Zone
module "dns" {
  source              = "./modules/dns"
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_zone_name       = var.dns_zone_name
}

# Load Balancer
module "load_balancer" {
  source              = "./modules/load_balancer"
  resource_group_name = var.resource_group_name
  location            = var.location
  lb_name             = var.lb_name
  public_ip_name      = var.public_ip_name
}

# Key Vault
module "key_vault" {
  source                      = "./modules/key_vault"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  name                        = var.key_vault_name
  key_vault_name              = var.key_vault_name
  soft_delete_retention_days  = var.soft_delete_retention_days
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name
  administrator_login         = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

# Key Vault Access Policies
module "key_vault_access_policy_current" {
  source            = "./modules/key_vault_access_policy"
  key_vault_id      = module.key_vault.id
  tenant_id         = data.azurerm_client_config.current.tenant_id
  object_id         = data.azurerm_client_config.current.object_id
  key_permissions   = var.current_user_key_permissions
  secret_permissions = var.current_user_secret_permissions
}

module "key_vault_access_policy_service_principal" {
  source            = "./modules/key_vault_access_policy"
  key_vault_id      = module.key_vault.id
  tenant_id         = data.azurerm_client_config.current.tenant_id
  object_id         = data.azuread_service_principal.service_principal.object_id
  key_permissions   = var.service_principal_key_permissions
  secret_permissions = var.service_principal_secret_permissions
}
