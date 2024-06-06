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
admin_username = "azureuser"
admin_ssh_key  = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
parent_id = module.resource_group.id


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
