output "key_vault_id" {
  value = azurerm_key_vault.key_vault.id
}

output "key_vault_name" {
  value = azurerm_key_vault.key_vault.name
}

# Outputs
output "existing_secret_value" {
  value = var.use_existing_secret ? data.azurerm_key_vault_secret.existing_secret.value : null
}

output "new_secret_id" {
  value = var.use_existing_secret ? null : azurerm_key_vault_secret.new_secret[0].id
}