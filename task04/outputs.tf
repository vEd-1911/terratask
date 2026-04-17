output "vm_public_ip" {
  description = "Public IP address of the virtual machine"
  value       = azurerm_public_ip.pip-1.ip_address
}

output "vm_fqdn" {
  description = "Fully qualified domain name of the virtual machine"
  value       = azurerm_public_ip.pip-1.fqdn
}
