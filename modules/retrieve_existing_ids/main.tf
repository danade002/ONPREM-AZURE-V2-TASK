variable "resource_group_name" {
  description = "Name of the resource group containing the resources"
}

# Data source for App Service
data "azurerm_app_service" "Insaitstaticwebapp123" {
  name                = "Insaitstaticwebapp123"
  resource_group_name = var.resource_group_name
}

# Data source for Virtual Machine
data "azurerm_virtual_machine" "insait-vm123" {
  name                = "insait-vm123"
  resource_group_name = var.resource_group_name
}

# Data source for PostgreSQL Server
data "azurerm_postgresql_server" "insaitpgserver123" {
  name                = "insaitpgserver123"
  resource_group_name = var.resource_group_name
}


