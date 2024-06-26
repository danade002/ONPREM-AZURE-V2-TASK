output "selected_secret" {
  value = var.pre_existing_secret != null ? var.pre_existing_secret : azurerm_key_vault_secret.new_secret[0].id
}

output "admin_credentials" {
  value = {
    name     = var.admin_name
    password = var.admin_password
     condition = var.admin_name != null && var.admin_password != null
  }
}

 