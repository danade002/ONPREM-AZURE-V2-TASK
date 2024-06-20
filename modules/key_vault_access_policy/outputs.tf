output "access_policy_id" {
  description = "The ID of the Key Vault Access Policy"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.id
}

output "object_id" {
  description = "The object ID associated with the access policy"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.object_id
}

output "key_permissions" {
  description = "The key permissions assigned"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.key_permissions
}

output "secret_permissions" {
  description = "The secret permissions assigned"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.secret_permissions
}
