output "key_vault_id" {
  value = azurerm_key_vault.key_vault.id
}

output "final_admin_login_password" {
  value = local.final_admin_login_password
}

output "administrator_login" {
  value = var.administrator_login
}

output "administrator_login_password" {
  value = var.administrator_login_password
}
