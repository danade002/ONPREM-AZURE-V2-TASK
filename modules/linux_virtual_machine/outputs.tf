output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

# output "public_key" {
#   value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
# }

# output "private_key" {
#   value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).privateKey
# }

output "public_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}
