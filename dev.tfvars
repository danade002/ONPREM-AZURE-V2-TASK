resource_group_name = "valley-dev"
location     = "east us"
create_new_resource_group = false

# Networking
vnet_name            = "insaitvnet"
vnet_address_space   = ["10.0.0.0/16"]
network_interface_id = "insaitnic"

subnet_name           = "insaitsubnet"
subnet_address_prefix = "10.0.1.0/24"

# Virtual Machine
vm_name        = "insait-vm"
vm_size        = "Standard_B4ms"
admin_username = "insait"

# Azure Container Registry (ACR)
registry_name = "insaitcontainerregistry"

# PostgreSQL Server
pg_server_name = "insaitpgserver"
pg_databases   = ["insait_backend", "metabase", "bank_db"]

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

secrets = {
 administrator-login          = "insaitpgadmin"
administrator-login-password = "hP7-MH1o-AOL5B4N20fe"
}

purge_protection_enabled = true
soft_delete_retention_days = 7
sku_name = "premium"
key_vault_name = "onpreminaitkv034123"

administrator-login = "insaitpgadmin123"
administrator-login-password = "hP7-MH1o-AOL5B4N20fe123"

existing_secret_name = "your-existing-secret-name"

generate_secret_length = 16
generate_secret_special = true

use_admin_credentials = false
use_existing_secret = true
use_generate_secret = false