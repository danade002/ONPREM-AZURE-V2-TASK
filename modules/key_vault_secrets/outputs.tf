output "secret_ids" {
  description = "Map of secret names to their IDs"
  value = {
    for s in azurerm_key_vault_secret.secrets : s.name => s.id
  }
}

output "secret_values" {
  description = "Map of secret names to their values"
  value = {
    for s in azurerm_key_vault_secret.secrets : s.name => s.value
  }
}
