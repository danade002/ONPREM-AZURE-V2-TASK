output "admin_secret_names" {
  description = "Names of the secrets related to administrator credentials"
  value = [
    azurerm_key_vault_secret.admin_login[*].name,
    azurerm_key_vault_secret.admin_login_password[*].name,
  ]
}

output "generated_secret_name" {
  description = "Name of the generated secret"
  value       = var.use_generate_secret ? azurerm_key_vault_secret.generated_secret[0].name : ""
}

output "existing_secret_value" {
  description = "Value of the existing secret retrieved from Key Vault"
  value       = var.use_existing_secret ? data.azurerm_key_vault_secret.existing[0].value : ""
}
