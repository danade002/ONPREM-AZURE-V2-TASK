resource "azurerm_key_vault_secret" "generated_secret" {
  count       = var.use_generate_secret ? 1 : 0  # Only create the secret if use_generate_secret is true
  name        = var.secret_name
  value       = random_password.generate[count.index].result  # Access result using count.index
  key_vault_id = var.key_vault_id
}

resource "random_password" "generate" {
  count            = var.use_generate_secret ? 1 : 0  # Only generate the password if use_generate_secret is true
  length           = var.generate_secret_length
  special          = var.generate_secret_special
  override_special = "!@%^"
}