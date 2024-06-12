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
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azapi" {}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}


module "virtual_network" {
  source              = "./modules/virtual_network"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
}

module "subnet" {
  source              = "./modules/subnet"
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.virtual_network.vnet_name
  subnet_name         = var.subnet_name
  address_prefix      = var.subnet_address_prefix
}

module "linux_virtual_machine" {
  source               = "./modules/linux_virtual_machine"
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  subnet_id            = module.subnet.subnet_id
  admin_username       = var.admin_username
  network_interface_id = var.network_interface_id
}

module "container_registry" {
  source              = "./modules/container_registry"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  registry_name       = var.registry_name
}

module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  server_name         = var.pg_server_name
  databases           = var.pg_databases
}


module "dns" {
  source              = "./modules/dns"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  dns_zone_name       = var.dns_zone_name
  machine_ip          = var.machine_ip
  subdomain_name      = var.subdomain_name
  domain_name         = var.domain_name
}


data "azurerm_client_config" "current" {}





module "key_vault" {
  source = "./modules/key_vault"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  soft_delete_retention_days = var.soft_delete_retention_days
  name                = var.key_vault_name
  certificate_name    = var.certificate_name
  certificate_path    = var.certificate_path
  certificate_password = var.certificate_password
  certificate_uri = var.certificate_uri
  id = var.id
  key_vault_name = var.key_vault_name
}

module "key_vault_certificate" {
  source = "./modules/key_vault_certificate"
  key_vault_id      = module.key_vault.id
  dns_names         = var.dns_names
  subject           = var.subject
  validity_in_months = var.validity_in_months
  certificate_name = var.certificate_name
}
