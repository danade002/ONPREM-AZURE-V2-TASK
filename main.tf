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

provider "azapi" {}

provider "azurerm" {
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
}




data "azurerm_client_config" "current" {}

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
  administrator_login         = data.azurerm_key_vault_secret.admin_login.value
  administrator_login_password = data.azurerm_key_vault_secret.admin_password.value
  postgresql_server_administrator_login = data.azurerm_key_vault_secret.admin_login.value
  postgresql_server_administrator_login_password = data.azurerm_key_vault_secret.admin_password.value
  postgresql_server_name = var.pg_server_name

}


module "keyvault" {
  source              = "./modules/key_vault"
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_name      = var.key_vault_name
  dns_zone_name = var.dns_zone_name
  certificate_name = var.certificate_name
  certificate_uri  = var.certificate_uri
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  object_id                   = data.azurerm_client_config.current.object_id
  key_vault_id                 = var.key_vault_id
}


module "app_service" {
  source                = "./modules/app_service"
  resource_group_name   = var.resource_group_name
  location              = var.location
  app_service_name      = var.app_service_name
  app_service_plan_name = var.app_service_plan_name
  domain_name           = var.domain_name
  
  # app_service_url       = var.app_service_url
  # custom_hostname_binding_id = var.custom_hostname_binding_id
}

module "dns" {
  source              = "./modules/dns"
  resource_group_name = var.resource_group_name
  domain_name         = var.domain_name
  subdomain_name      = var.subdomain_name
  machine_ip          = var.machine_ip
  location            = var.location
  dns_zone_name       = var.dns_zone_name
  dns_zone_id         = var.dns_zone_id
  
}


data "azurerm_key_vault_secret" "admin_login" {
  name         = "administrator-login"
  key_vault_id = module.keyvault.key_vault_id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "administrator-password"
  key_vault_id = module.keyvault.key_vault_id
}