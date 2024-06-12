
resource "azurerm_key_vault" "danielinsaitvault12" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "standard"

  tenant_id = var.tenant_id
}

resource "azurerm_key_vault_certificate" "example" {
  name         = var.certificate_name
  key_vault_id = azurerm_key_vault.example.id

  certificate {
    contents = filebase64(var.certificate_path)
    password = var.certificate_password
  }
}


resource "azurerm_key_vault" "example" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = var.soft_delete_retention_days

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    certificate_permissions = [
      "Create",
      "Delete",
      "DeleteIssuers",
      "Get",
      "GetIssuers",
      "Import",
      "List",
      "ListIssuers",
      "ManageContacts",
      "ManageIssuers",
      "Purge",
      "SetIssuers",
      "Update",
    ]

    key_permissions = [
      "Backup",
      "Create",
      "Decrypt",
      "Delete",
      "Encrypt",
      "Get",
      "Import",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Sign",
      "UnwrapKey",
      "Update",
      "Verify",
      "WrapKey",
    ]

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set",
    ]
  }
}


