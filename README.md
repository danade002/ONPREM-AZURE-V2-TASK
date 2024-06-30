# Azure Terraform Infrastructure for On-Prem

This repository contains the Terraform configuration files for setting up the On-Prem infrastructure on Azure.

## Prerequisites

Before running this code, make sure you have the following prerequisites:

- Azure Service Principal credentials
- Terraform 1.8.3
- Azure CLI

## Local Environment Setup

Follow these steps to set up the project:

1. **Install Azure CLI**: Make sure you have the Azure CLI installed on your local machine.
2. **Initialize Azure CLI with credentials**: Authenticate the Azure CLI with your Azure credentials.

## Configuration Variables (`dev.tfvars`)

Here's a brief description of the variables in the `dev.tfvars` file:

- `admin_username`: The username for the Azure admin account.
- `admin_ssh_key`: The path to the public SSH key for the Azure admin account.
- `registry_name`: The name of the Azure Container Registry (ACR).
- `pg_server_name`: The name of the PostgreSQL server.
- `pg_databases`: A list of databases to be created on the PostgreSQL server.
- `storage_account_name`: The name of the Azure Storage Account.
- `dns_zone_name`: The name of the Azure DNS Zone.
- `public_ip_name`: The name of the public IP address.
- `lb_name`: The name of the Load Balancer.
- `create_new_rg`: A flag to determine whether to create a new resource group or use an existing one. Set to true to create a new resource group, and false to use an existing resource group.
- `existing_rg_name`: The name of the existing resource group to use if `create_new_rg` is set to false.
- `new_rg_name`: The name of the new resource group to create if `create_new_rg` is set to true.
- `location`: The location for the resource group and resources.

## Variable Details

### `create_new_rg`
- **Description:** A flag to determine whether to create a new resource group or use an existing one. Set to `true` to create a new resource group, and `false` to use an existing resource group.
- **Type:** bool
- **Default:** false

### `existing_rg_name`
- **Description:** The name of the existing resource group to use if `create_new_rg` is set to `false`.
- **Type:** string
- **Default:** "existing-rg-name"

### `new_rg_name`
- **Description:** The name of the new resource group to create if `create_new_rg` is set to `true`.
- **Type:** string
- **Default:** "new-rg-name"

### `location`
- **Description:** The location for the resource group and resources.
- **Type:** string
- **Default:** "East US"

## How to Use

1. Update the `dev.tfvars` file with your specific configuration values.
2. Run `terraform init -backend-config='dev.config'`.
3. Run `terraform plan -var-file=dev.tfvars` to see the changes that will be made.
4. Run `terraform apply -var-file=dev.tfvars` to apply the changes.

Please ensure you have the necessary permissions and the Azure CLI installed and configured before running these commands.

## CI/CD

All changes are applied in the CI. On EVERY Pull Request, the version should be bumped (patch if no other changes are required).

- **On a PR**: `init` & `plan` are run on CI without `apply`.
- **On merge of PR to main**: `init`, `plan` & `apply` are run on Insait's Azure subscription (dev).

## Modules

This repository contains several modules, each responsible for creating a specific resource in Azure. These modules include:

- `linux_virtual_machine`: Creates a Linux virtual machine.
- `container_registry`: Creates an Azure Container Registry.
- `postgresql`: Creates a PostgreSQL server and databases.
- `dns`: Creates a DNS zone.
- `virtual_network`: Creates a virtual network.
- `subnet`: Creates a subnet within the virtual network.
- `resource_group`: Creates a resource group to deploy the infrastructure.