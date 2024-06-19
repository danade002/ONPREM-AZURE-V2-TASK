output "name" {
  value = azurerm_key_vault.key_vault.name
}

output "vault_uri" {
  value = azurerm_key_vault.key_vault.vault_uri
}
output "admin_login_secret_id" {
  value = azurerm_key_vault_secret.admin_login_secret.id
}

output "admin_password_secret_id" {
  value = azurerm_key_vault_secret.admin_password_secret.id
}
