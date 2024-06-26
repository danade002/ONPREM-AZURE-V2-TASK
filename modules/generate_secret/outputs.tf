output "generated_password" {
  value       = length(random_password.admin_password) > 0 ? random_password.admin_password[0].result : ""
  description = "The generated admin password"
}

output "admin_password_secret_id" {
  value       = length(azurerm_key_vault_secret.admin_password_secret) > 0 ? azurerm_key_vault_secret.admin_password_secret[0].id : ""
  description = "ID of the Key Vault secret for admin password"
}
