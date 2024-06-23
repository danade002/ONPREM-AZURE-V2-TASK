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
  resource_group_exists     = length(data.azurerm_resource_group.existing_rg) > 0
 
}

module "load_balancer" {
  source = "./modules/load_balancer"
  resource_group_name = var.resource_group_name
  location = var.location
  lb_name = var.lb_name
  public_ip_name = var.public_ip_name
  
}