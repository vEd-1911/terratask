output "traffic_manager_fqdn" {
  value       = { for tm_key, tm in module.TM : tm_key => tm.fqdn }
  description = "The fully qualified domain name of the traffic manager profile"
}