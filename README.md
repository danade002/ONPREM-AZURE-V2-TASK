Sure! Below is the updated README.md file including the Azure Key Vault setup instructions with the three conditions:

---

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
- `use_admin_credentials`: Flag to determine if admin credentials should be used directly.
- `use_existing_secret`: Flag to determine if existing secrets in Azure Key Vault should be used.
- `use_generate_secret`: Flag to determine if new secrets should be generated and stored in Azure Key Vault.
- `existing_secret_names`: List of names of existing secrets in Azure Key Vault (used if `use_existing_secret` is true).
- `key_vault_name`: The name of the Azure Key Vault.
- `resource_group_name`: The name of the resource group containing the Azure Key Vault.

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

### `use_admin_credentials`
- **Description:** Flag to determine if admin credentials should be used directly.
- **Type:** bool
- **Default:** false

### `use_existing_secret`
- **Description:** Flag to determine if existing secrets in Azure Key Vault should be used.
- **Type:** bool
- **Default:** false

### `use_generate_secret`
- **Description:** Flag to determine if new secrets should be generated and stored in Azure Key Vault.
- **Type:** bool
- **Default:** false

### `existing_secret_names`
- **Description:** List of names of existing secrets in Azure Key Vault (used if `use_existing_secret` is true).
- **Type:** list(string)
- **Default:** []

### `key_vault_name`
- **Description:** The name of the Azure Key Vault.
- **Type:** string

### `resource_group_name`
- **Description:** The name of the resource group containing the Azure Key Vault.
- **Type:** string

## How to Use

1. Update the `dev.tfvars` file with your specific configuration values.
2. Run `terraform init -backend-config='dev.config'`.
3. Run `terraform plan -var-file=dev.tfvars` to see the changes that will be made.
4. Run `terraform apply -var-file=dev.tfvars` to apply the changes.

### Managing Azure Key Vault Secrets

#### Scenario 1: Generating New Secrets

Set the following values in `dev.tfvars` to generate new secrets:

```hcl
use_admin_credentials = false
use_existing_secret   = false
use_generate_secret   = true
```

Apply the configuration:


terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars


#### Scenario 2: Using Existing Secrets

To use existing secrets from Azure Key Vault, configure `dev.tfvars` as follows:


use_admin_credentials = false
use_existing_secret   = true
use_generate_secret   = false
existing_secret_names = ["existing-secret-name1", "existing-secret-name2"]
key_vault_name        = "your-key-vault-name"
resource_group_name   = "your-resource-group-name"


Apply the configuration:

terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars


#### Scenario 3: Using Provided Admin Credentials

For using provided admin credentials without generating or using existing secrets:

use_admin_credentials = true
use_existing_secret   = false
use_generate_secret   = false
administrator_login   = "insaitpgadmin12"
administrator_login_password = "hP7-MH1o-AOL5B4N20fe12"

Apply the configuration:


terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars


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
- `key_vault` : Securely manages sensitive information.
- `key_vault_secret`: Securely stores and manages secrets in the key vault.
