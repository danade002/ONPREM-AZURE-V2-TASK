output "secret_names" {
  value = [for secret in azurerm_key_vault_secret.secrets : secret.name]
}