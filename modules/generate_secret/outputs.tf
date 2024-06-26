output "generated_password" {
  value = random_password.admin_password[0].result
  description = "The generated admin password"
}

output "admin_password_secret_id" {
  value = azurerm_key_vault_secret.admin_password_secret[0].id
  description = "ID of the Key Vault secret for generated admin password"
  
}
