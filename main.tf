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
  skip_provider_registration = true
  features {}
  
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
  resource_group_name = var.resource_group_name
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
 resource_group_name =var.resource_group_name
  location            = var.location
  server_name         = var.pg_server_name
  databases           = var.pg_databases
  administrator-login = var.secrets.administrator-login
  administrator-login-password = var.secrets.administrator-login-password
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
  source = "./modules/load_balancer"
  resource_group_name = var.resource_group_name
  location = var.location
  lb_name = var.lb_name
  public_ip_name = var.public_ip_name
  
}

module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days
  sku_name = var.sku_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  administrator_login = var.secrets.administrator-login
  administrator_login_password = var.secrets.administrator-login-password
}

module "key_vault_secrets" {
  source       = "./modules/key_vault_secrets"
  key_vault_id = module.key_vault.key_vault_id
  secrets      = var.secrets
}
data "azurerm_client_config" "current" {}

module "log_analytics_workspace" {
  source              = "./modules/log_analytics_workspace"
  name                = "log-analytics-workspace"
  location            = var.location
  resource_group_name =var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

module "app_service_diagnostics" {
  source                       = "./modules/diagnostic_settings"
  name                         = "app-service-diagnostics"
  target_resource_id           = var.app_service_id
  log_analytics_workspace_id   = module.log_analytics_workspace.id
  logs = [
    {
      category = "AppServiceHTTPLogs"
      enabled  = true
      retention_policy = {
        enabled = false
      }
    }
  ]
  metrics = [
    {
      category = "AllMetrics"
      enabled  = true
      retention_policy = {
        enabled = false
      }
    }
  ]
}

module "alerts" {
  source              = "./modules/alerts"
  name                = "Insait-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "Insait"
  email_receivers = [
    { name = "idan", email_address = "idan@insait.io" },
    { name = "renzo", email_address = "renzo@insait.io" },
    { name = "yanay", email_address = "yanay@insait.io" }
  ]
  app_service_id         = var.app_service_id
  linux_vm_id            = var.linux_vm_id
  postgresql_server_id   = var.postgresql_server_id
  application_insights_id = var.application_insights_id
}