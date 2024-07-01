# Azure Terraform Infrastructure for On-Prem with PostgreSQL

Welcome to the repository containing Terraform configuration files for setting up On-Prem infrastructure on Azure, specifically tailored for PostgreSQL deployment.

## Prerequisites

Before running this code, ensure you have the following prerequisites:

- Azure Service Principal credentials
- Terraform 1.8.3 or later
- Azure CLI

## Local Environment Setup

To set up your local environment:

1. **Install Azure CLI**: Ensure the Azure CLI is installed on your machine.
2. **Authenticate Azure CLI**: Log in with your Azure credentials.

## Configuration Variables (`dev.tfvars`)

Here's a breakdown of the variables in `dev.tfvars`:

- `admin_username`: Username for the Azure admin account.
- `admin_ssh_key`: Path to the public SSH key for the Azure admin account.
- `registry_name`: Name of the Azure Container Registry (ACR).
- `pg_server_name`: Name of the PostgreSQL server.
- `pg_databases`: List of databases to create on the PostgreSQL server.
- `storage_account_name`: Name of the Azure Storage Account.
- `dns_zone_name`: Name of the Azure DNS Zone.
- `public_ip_name`: Name of the public IP address.
- `lb_name`: Name of the Load Balancer.
- `create_new_rg`: Flag to create a new resource group (`true`) or use an existing one (`false`).
- `existing_rg_name`: Name of the existing resource group (used if `create_new_rg` is `false`).
- `new_rg_name`: Name of the new resource group to create (used if `create_new_rg` is `true`).
- `location`: Location for the resource group and resources.
- `administrator_login`: Admin login username for PostgreSQL.
- `administrator_login_password`: Admin login password for PostgreSQL.
- `use_admin_credentials`: Flag to use provided admin credentials (`true` or `false`).
- `use_existing_secret`: Flag to use an existing secret from Azure Key Vault (`true` or `false`).
- `use_generate_secret`: Flag to generate a new secret (`true` or `false`).
- `existing_secret_name`: Name of the existing secret in Azure Key Vault (used if `use_existing_secret` is `true`).

## How to Use

1. Update `dev.tfvars` with your specific configuration values.
2. Run `terraform init -backend-config='dev.config'`.
3. Run `terraform plan -var-file=dev.tfvars` to preview changes.
4. Run `terraform apply -var-file=dev.tfvars` to apply changes.

Ensure Azure CLI is configured and permissions are set before executing these commands.

## CI/CD

CI/CD pipeline automates the deployment process:

- **On PR**: Runs `init` & `plan`.
- **On merge to main**: Runs `init`, `plan`, & `apply` on Insait's Azure subscription (dev).

## Modules

Modules in this repository:

- `linux_virtual_machine`: Creates a Linux VM.
- `container_registry`: Creates an Azure Container Registry.
- `postgresql`: Deploys PostgreSQL server and databases.
- `dns`: Sets up DNS zone.
- `virtual_network`: Establishes virtual network.
- `subnet`: Creates subnet within virtual network.
- `resource_group`: Creates resource group.

## Key Vault and Secrets Management

Manages Azure Key Vault and secrets:

- `random_password.generated_password`: Generates random password.
- `azurerm_key_vault_secret.existing`: Retrieves existing secret.
- `azurerm_key_vault_secret.admin_login`: Stores PostgreSQL admin login.
- `azurerm_key_vault_secret.admin_login_password`: Stores PostgreSQL admin password.
- `random_password.generated_secret_value`: Generates random secret value.
- `azurerm_key_vault_secret.generated_secret`: Stores generated secret.
- `azurerm_key_vault.key_vault`: Configures Azure Key Vault.

## Administrator Credentials and Secret Options

Variables for PostgreSQL admin credentials and secrets:

- `administrator_login`: Admin username for PostgreSQL.
- `administrator_login_password`: Admin password for PostgreSQL.
- `use_admin_credentials`: Use provided admin credentials (`true` or `false`).
- `use_existing_secret`: Use existing secret from Key Vault (`true` or `false`).
- `use_generate_secret`: Generate new secret (`true` or `false`).
- `existing_secret_name`: Name of existing Key Vault secret (if `use_existing_secret` is `true`).

### Conditions for Scenarios

1. **Provided Admin Credentials**:
   - Set `use_admin_credentials` to `true`.
   - Ensure `administrator_login` and `administrator_login_password` are in `dev.tfvars`.

2. **Using Existing Secret**:
   - Set `use_existing_secret` to `true`.
   - Set `existing_secret_name` to Key Vault secret name.
   - Ensure `use_admin_credentials` and `use_generate_secret` are `false`.

3. **Generating New Secret**:
   - Set `use_generate_secret` to `true`.
   - Ensure `use_admin_credentials` and `use_existing_secret` are `false`.


