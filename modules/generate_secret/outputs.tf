output "generated_password" {
  value       = length(random_password.administrator-login-password) > 0 ? random_password.administrator-login-password[0].result : ""
  description = "The generated admin password"
}

output "admin_password_secret_id" {
  value       = length(azurerm_key_vault_secret.administrator-login-password_secret) > 0 ? azurerm_key_vault_secret.administrator-login-password_secret[0].id : ""
  description = "ID of the Key Vault secret for generated admin password"
}
