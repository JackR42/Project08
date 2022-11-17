output "vm_id" {
  value = azurerm_virtual_machine.windows_vm.id
}

output "vm_name" {
  value = azurerm_virtual_machine.windows_vm.name
}

output "vm_location" {
  value = azurerm_virtual_machine.windows_vm.location
}

output "vm_resource_group_name" {
  value = azurerm_virtual_machine.windows_vm.resource_group_name
}

output "static_ip_address" {
  value = azurerm_network_interface.vm_nic.private_ip_address
}
