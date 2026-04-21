output "traffic_manager_fqdn" {
  value       = module.TM.fqdn
  description = "The fully qualified domain name of the traffic manager profile"
}