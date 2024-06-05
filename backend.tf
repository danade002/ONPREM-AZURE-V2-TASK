terraform {
  backend "azurerm" {
    resource_group_name   = "daniel-sandbox"
    storage_account_name  = "insaittfstatedev"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
