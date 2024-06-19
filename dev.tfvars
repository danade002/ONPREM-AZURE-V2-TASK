location             = "east us"
resource_group_name  = "danieltestrg"
storage_account_name = "danieltestsa"
create_resource_group = true




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


key_vault_name = "onpremkeyvault123"
key_vault_location = "eastus"
administrator_login = "insaitpgadmin"
administrator_login_password = "hP7-MH1o-AOL5B4N20fe"
soft_delete_retention_days = 7
enabled_for_disk_encryption = true
purge_protection_enabled  = true
sku_name = "standard"
key_permissions = ["Get", "List"]
secret_permissions = ["Get", "List"]
storage_permissions = ["Get", "List"]




 