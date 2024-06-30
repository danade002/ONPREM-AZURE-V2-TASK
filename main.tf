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

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azapi" {}

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

module "container_registry" {
  source              = "./modules/container_registry"
  resource_group_name = var.resource_group_name
  location            = var.location
  registry_name       = var.registry_name
}

module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.pg_server_name
  databases           = var.pg_databases
  administrator_login = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

module "dns" {
  source              = "./modules/dns"
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_zone_name       = var.dns_zone_name
}

module "resource_group" {
  source                    = "./modules/resource_group"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  create_new_resource_group = var.create_new_resource_group
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  resource_group_name = var.resource_group_name
  location            = var.location
  lb_name             = var.lb_name
  public_ip_name      = var.public_ip_name
}

module "key_vault" {
  source                        = "./modules/key_vault"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = var.sku_name
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  key_vault_name                = var.key_vault_name
  use_existing_secret           = var.use_existing_secret
  administrator_login_value     = var.administrator_login
  administrator_login_password_value = var.administrator_login_password
  key_vault_id                  = var.key_vault_id
  use_generate_secret           = var.use_generate_secret
  existing_secret_name          = var.existing_secret_name
  use_admin_credentials = var.use_admin_credentials
  generate_secret = var.generate_secret
  administrator_login_password = var.administrator_login_password
}

module "key_vault_secrets" {
  source       = "./modules/key_vault_secrets"
  key_vault_id = module.key_vault.key_vault_id
  secrets = {
    administrator-login = {
      value = var.use_admin_credentials ? var.administrator_login : "admin"
    }
    administrator-login-password = {
      value = module.key_vault.final_admin_login_password
    }
  }
}