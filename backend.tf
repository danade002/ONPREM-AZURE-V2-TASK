terraform {
  backend "azurerm" {
    # resource_group_name  = "daniel-sandbox"
    # storage_account_name = "testademeso"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
