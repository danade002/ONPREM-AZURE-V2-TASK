terraform {
  backend "azurerm" {
    resource_group_name  = "daniel-sandbox-onprem"
    storage_account_name = "testademeso"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
