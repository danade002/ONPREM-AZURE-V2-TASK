# modules/resource_group/outputs.tf

output "resource_group_id" {
  value = length(data.azurerm_resource_group.rg.*.name) == 0 ? azurerm_resource_group.rg[0].id : data.azurerm_resource_group.rg[0].id
}
