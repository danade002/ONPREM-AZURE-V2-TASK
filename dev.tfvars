location            = "eastus"
resource_group_name = "daniel-sandbox12"

# Networking
vnet_name            = "insaitvnet"
vnet_address_space   = ["10.0.0.0/16"]
network_interface_id = "insaitnic"

subnet_name           = "insaitsubnet"
subnet_address_prefix = "10.0.1.0/24"

# Virtual Machine
vm_name        = "Insait-Vm"
vm_size        = "Standard_B4ms"
admin_username = "insait"


# Azure Container Registry (ACR)
registry_name = "insaitcontainerregistry"

# PostgreSQL Server
pg_server_name = "insaitpgserver"
pg_databases   = ["insait_backend", "metabase", "bank_db"] # Ensure this is a list

# Storage Account
storage_account_name = "testademeso"

# Azure DNS Zone
dns_zone_name = "insaitdnszone.com"

# Public IP and Load Balancer
public_ip_name = "insaitPublicIP"
lb_name        = "insaitLoadBalancer"

# Container Group and Container
container_group_name = "insaitContainerGroup"
container_name       = "insaitContainer"
image                = "nginx:latest"
cpu                  = 1
memory               = 1
port                 = 80

# Static Web App
static_site_name = "insaitStaticWebApp"

#app name
app_name = "insaitapp"

#source code path
source_code_path = "/path/to/your/source/code"


# Domain and Subdomain Variables
domain_name         = "insit.io"
subdomain_name      = "test.insiat.io"
machine_ip          = "203.0.113.10"



# Key Vault Variables
key_vault_name      = "danielkeyvault12"
soft_delete_retention_days = 7
certificate_name    = "insait-cert"
dns_names           = ["insait.io", "test.insait.io"]
subject             = "CN=hello-world"
validity_in_months  = 12
certificate_password = "daniel1234"
certificate_path    = "/path/to/your/certificate"
certificate_uri     = "https://danielkeyvault12.vault.azure.net/secrets/insait-cert/1234567890abcdef1234567890abcdef"
id                  = "https://danielkeyvault12.vault.azure.net/secrets/insait-cert/1234567890abcdef1234567890abcdef"
thumbprint          = "1234567890abcdef1234567890abcdef12345678"
app_service_name = "insaitappservice12"
app_service_plan_id = "/subscriptions/12345678-1234-1234-1234-1234567890ab/resourceGroups/daniel-sandbox12/providers/Microsoft.Web/serverfarms/insaitappserviceplan12"
certificate_id = "danilekeyvault12.vault.azure.net/secrets/insait-cert/1234567890abcdef1234567890abcdef"
