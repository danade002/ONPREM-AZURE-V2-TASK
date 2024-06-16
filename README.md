## Azure Terraform Infrastructure for On-Prem

### Prerequisites
Before running this code, make sure you have the following prerequisites:

- Azure Service Principal credentials

### Local env installation
Follow these steps to set up the project: 

- Terraform **1.8.3**
- Install Azure CLI
- Initialize Azure CLI with credentials

### Apply Changes
- **You will not success to apply changes from your terminal.**
- All changes are applied in the CI. 
- On **EVERY** Pull Request the version should be bumped (patch if no required otherwise).
- On a PR - init & plan is running on CI **without apply**
- On merge of PR to main - init, plan & apply is running on Insait's azure subscription (dev).
### Initialize the backend: 

```bash
# For Staging environment
terraform init --backend-config=staging.config
```
### Verify before applying

``` bash
# Staging
terraform plan -var-file staging.tfvars
```
### Applying changes 

All changes are applied in the CI. Open a pull request.
```bash
git push (to your remote branch) + open a Pull request. 
```

# Terraform Configuration for InSait Infrastructure

This repository contains the Terraform configuration files for setting up the InSait infrastructure on Azure.

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

## How to Use

1. Update the `dev.tfvars` file with your specific configuration values.
2. Run `terraform init` to initialize your Terraform workspace.
3. Run `terraform plan -var-file=dev.tfvars` to see the changes that will be made.
4. Run `terraform apply -var-file=dev.tfvars` to apply the changes.

Please ensure you have the necessary permissions and the Azure CLI installed and configured before running these commands.