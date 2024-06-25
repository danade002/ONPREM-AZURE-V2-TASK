resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = var.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days
  

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "Backup",
      "Restore",
    ]
  }
}

data "azurerm_client_config" "current" {}


# Retrieve existing secret only if use_existing_secret is true
data "azurerm_key_vault_secret" "existing_secret" {
  name         = var.use_existing_secret ? var.existing_secret : null
  key_vault_id = var.key_vault_id
}

# Create new secret only if use_existing_secret is false
resource "azurerm_key_vault_secret" "new_secret" {
  count        = var.use_existing_secret ? 0 : 1
  name         = var.new_secret_name
  value        = var.new_secret_value
  key_vault_id = var.key_vault_id
}
