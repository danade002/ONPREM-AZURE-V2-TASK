output "resource_group_name" {
  value = var.create ? azurerm_resource_group.rg[0].name : null
}