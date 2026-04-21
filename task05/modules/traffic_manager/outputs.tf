output "fqdn" {
  description = "the fully qualified domain name of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.tm.fqdn
}

output "tm_id" {
  description = "the id of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.tm.id
}