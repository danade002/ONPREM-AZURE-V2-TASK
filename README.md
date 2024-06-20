## Auzure Terraform Infrastructure for On-Prem

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
