

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  
  sku_name = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get ,List, Create, Delete, Recover, Backup, Restore, Encrypt, Decrypt, UnwrapKey, WrapKey, Verify, Sign, Purge",
    ]

    secret_permissions = [
      "Get, List, Set, Delete, Recover, Backup, Restore, Purge, Recover, Backup, Restore, Purge, Encrypt, Decrypt, UnwrapKey, WrapKey, Verify, Sign, Purge",
    ]

    storage_permissions = [
      "Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Purge, Get, List, Delete, Set, Update, RegenerateKey, Recover, Purge, Backup, Restore, Restore, Purge, Recover, Backup, Restore, Purge, GetSas, ListSas, UpdateSas, RegenerateSas, Recover, Backup, Restore, Pur",
    ]
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_secret" "admin_login" {
  name         = "administrator-login"
  value        = var.administrator_login
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "administrator-login-password"
  value        = var.administrator_login_password
  key_vault_id = azurerm_key_vault.key_vault.id
}