
output "secret_values" {
  value = { for key, secret in azurerm_key_vault_secret.secrets : key => secret.value }
}