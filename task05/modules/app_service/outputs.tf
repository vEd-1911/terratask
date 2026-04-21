output "id" {
  description = "id of web app"
  value       = azurerm_windows_web_app.windows_web_app.id
}

output "name" {
  description = "name of web app"
  value       = azurerm_windows_web_app.windows_web_app.name
}

output "default_host_name" {
  description = "default host name of web app"
  value       = azurerm_windows_web_app.windows_web_app.default_hostname
}