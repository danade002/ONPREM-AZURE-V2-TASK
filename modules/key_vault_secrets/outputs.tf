output "admin_credentials_secret_id" {
  value = azurerm_key_vault_secret.admin_credentials[*].id
}

output "existing_secret_id" {
  value = azurerm_key_vault_secret.existing_secret[*].id
}

output "new_secret_id" {
  value = azurerm_key_vault_secret.new_secret[*].id
}
