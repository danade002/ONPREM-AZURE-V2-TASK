resource_group_name = "daniel-sandbox"
location     = "east us"
create_new_resource_group = false

# Networking
vnet_name            = "insaitvnet123"
vnet_address_space   = ["10.0.0.0/16"]
network_interface_id = "insaitnic123"

subnet_name           = "insaitsubnet123"
subnet_address_prefix = "10.0.1.0/24"

# Virtual Machine
vm_name        = "insait-vm123"
vm_size        = "Standard_B4ms"
admin_username = "insait123"

# Azure Container Registry (ACR)
registry_name = "insaitcontainerregistry123"

# PostgreSQL Server
pg_server_name = "insaitpgserver123"
pg_databases   = ["insait_backend", "metabase", "bank_db"]

# Azure DNS Zone
dns_zone_name = "insaitdnszone123.com"

# Public IP and Load Balancer
public_ip_name = "insaitPublicIP123"
lb_name        = "insaitLoadBalancer123"

# Container Group and Container
container_group_name = "insaitContainerGroup123"
container_name       = "insaitContainer123"
image                = "nginx:latest"
cpu                  = 1
memory               = 1
port                 = 80

# Static Web App
static_site_name = "insaitStaticWebApp123"

#app name
app_name = "insaitapp123"

#source code path
source_code_path = "/path/to/your/source/code"

secrets = {
 administrator-login          = "insaitpgadmin123"
administrator-login-password = "hP7-MH1o-AOL5B4N20fe123"
}

purge_protection_enabled = true
soft_delete_retention_days = 7
sku_name = "premium"
key_vault_name = "Predictive123"

app_service_id        = "<app-service-resource-id>"
linux_vm_id           = "/subscriptions/5b70678a-9913-4242-9e36-011a1b7c095e/resourceGroups/daniel-sandbox/providers/Microsoft.Compute/virtualMachines/insait-vm123"
postgresql_server_id  = "<postgresql-server-resource-id>"
application_insights_id = "<application-insights-resource-id>"