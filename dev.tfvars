resource_group_name        = "daniel-sandbox"
location                   = "eastus"
create_new_resource_group  = false

# Networking
vnet_name                  = "insaitvnet"
vnet_address_space         = ["10.0.0.0/16"]
network_interface_id       = "insaitnic"

subnet_name                = "insaitsubnet123"
subnet_address_prefix      = "10.0.1.0/24"

# Virtual Machine
vm_name                    = "insait-vm123"
vm_size                    = "Standard_B4ms"
admin_username             = "insait"

# Azure Container Registry (ACR)
registry_name              = "insaitcontainerregistry123"

# PostgreSQL Server
pg_server_name             = "insaitpgserver123"
pg_databases               = ["insait_backend", "metabase", "bank_db"]

# Azure DNS Zone
dns_zone_name              = "insaitdnszone123.com"

# Public IP and Load Balancer
public_ip_name             = "insaitPublicIP"
lb_name                    = "insaitLoadBalancer"

# Container Group and Container
container_group_name       = "insaitContainerGroup123"
container_name             = "insaitContainer123"
image                      = "nginx:latest"
cpu                        = 1
memory                     = 1
port                       = 80

# Static Web App
static_site_name           = "insaitStaticWebApp123"

# App Name
app_name                   = "insaitapp123"

# Source Code Path
source_code_path           = "/path/to/your/source/code"

#key vault
key_vault_name             = "onpremdanvaults"
key_vault_id = "azurerm_key_vault.key_vault.id"

# Administrator credentials and secret options
administrator_login = "insaitpgadmin12"
administrator_login_password = "hP7-MH1o-AOL5B4N20fe12"
use_admin_credentials = true
use_existing_secret = false
use_generate_secret = false
existing_secret_name = ""
administrator-login-secret-name = "administrator_login"
administrator-login-password-secret-name = "administrator_login_password"
