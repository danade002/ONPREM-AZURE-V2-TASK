Here is the updated README file including the administrator credentials and secret options, along with instructions on how to use the conditions for the three scenarios:

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
- `administrator_login`: The admin login username.
- `administrator_login_password`: The admin login password.
- `use_admin_credentials`: A flag to use provided admin credentials.
- `use_existing_secret`: A flag to use an existing secret from Azure Key Vault.
- `use_generate_secret`: A flag to generate a new secret.
- `existing_secret_name`: The name of the existing secret to be used if `use_existing_secret` is set to true.

## Variable Details

### `create_new_rg`
- **Description:** A flag to determine whether to create a new resource group or use an existing one. Set to `true` to create a new resource group, and `false` to use an existing resource group.
- **Type:** bool


### `existing_rg_name`
- **Description:** The name of the existing resource group to use if `create_new_rg` is set to `false`.
- **Type:** string


### `new_rg_name`
- **Description:** The name of the new resource group to create if `create_new_rg` is set to `true`.
- **Type:** string


### `location`
- **Description:** The location for the resource group and resources.
- **Type:** string
-

### `administrator_login`
- **Description:** The admin login username.
- **Type:** string


### `administrator_login_password`
- **Description:** The admin login password.
- **Type:** string


### `use_admin_credentials`
- **Description:** A flag to use provided admin credentials.
- **Type:** bool


### `use_existing_secret`
- **Description:** A flag to use an existing secret from Azure Key Vault.
- **Type:** bool


### `use_generate_secret`
- **Description:** A flag to generate a new secret.
- **Type:** bool


### `existing_secret_name`
- **Description:** The name of the existing secret to be used if `use_existing_secret` is set to `true`.
- **Type:** string


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

## Key Vault and Secrets Management

This configuration includes the management of Azure Key Vault and secrets with the following resources:

- `random_password.generated_password`: Generates a random password with special characters.
- `azurerm_key_vault_secret.existing`: Retrieves an existing secret from the Key Vault.
- `azurerm_key_vault_secret.admin_login`: Stores the admin login in the Key Vault.
- `azurerm_key_vault_secret.admin_login_password`: Stores the admin login password in the Key Vault.
- `random_password.generated_secret_value`: Generates a random value for a secret.
- `azurerm_key_vault_secret.generated_secret`: Stores the generated secret in the Key Vault.
- `azurerm_key_vault.key_vault`: Configures the Azure Key Vault with access policies.

## Administrator Credentials and Secret Options

The following variables allow you to manage the administrator credentials and secrets:

- `administrator_login`: The admin login username.
- `administrator_login_password`: The admin login password.
- `use_admin_credentials`: A flag to use provided admin credentials.
- `use_existing_secret`: A flag to use an existing secret from Azure Key Vault.
- `use_generate_secret`: A flag to generate a new secret.
- `existing_secret_name`: The name of the existing secret to be used if `use_existing_secret` is set to true.

### Using the Conditions for the Three Scenarios

1. **Using Provided Admin Credentials**:
   - Set `use_admin_credentials` to `true`.
   - Ensure `administrator_login` and `administrator_login_password` are provided in `dev.tfvars`.

2. **Using an Existing Secret**:
   - Set `use_existing_secret` to `true`.
   - Set `existing_secret_name` to the name of the existing secret in the Key Vault.
   - Ensure `use_admin_credentials` and `use_generate_secret` are set to `false`.

3. **Generating a New Secret**:
   - Set `use_generate_secret` to `true`.
   - Ensure `use_admin_credentials` and `use_existing_secret` are set to `false`.

By setting the appropriate flags, you can control whether to use provided admin credentials, an existing secret, or generate a new secret dynamically.

---

This README file provides a comprehensive guide for setting up the Azure Terraform infrastructure, including the use of conditions for administrator credentials and secret management.