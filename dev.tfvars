location            = "eastus"
resource_group_name = "daniel-sandbox12"

# Networking
vnet_name            = "insaitvnet"
vnet_address_space   = ["10.0.0.0/16"]
network_interface_id = "insaitnic"

subnet_name           = "insaitsubnet"
subnet_address_prefix = "10.0.1.0/24"

# Virtual Machine
vm_name        = "app-v1"
vm_size        = "Standard_B4ms"
admin_username = "insait"


# Azure Container Registry (ACR)
registry_name = "insaitcontainerregistry"

# PostgreSQL Server
pg_server_name = "insaitpgserver"
pg_databases   = ["insait_backend", "metabase", "bank_db"]


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

key_vault_name        = "dev-key_vault"
app_service_name      = "onpremV2-app-service"
app_service_plan_name = "onpremV2-app-service-plan"
domain_name           = "insait.io"
subdomain_name        = "test.insait.io"
machine_ip            = "172.191.4.28"

certificate_dns_names = ["insait.io", "test.insait.io"]
certificate_name = "insait-certificate"
certificate_uri = "insait of certificate_uri"
dns_zone_id = "insait of dns_zone_id"



  