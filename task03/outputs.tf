output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "storage_account_sa_blob_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
}

output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}