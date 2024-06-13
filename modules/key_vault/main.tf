
resource "azurerm_key_vault" "danielinsaitvault12" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions    = var.key_permissions
    secret_permissions = var.secret_permissions
  }
}


output "key_vault_id" {
  value = var.key_vault_id
}




data "azurerm_client_config" "current" {}


