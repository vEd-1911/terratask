variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "traffic_routing_method" {
  description = "Routing method for the traffic manager"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the traffic manager"
  type        = map(string)
}

variable "tm_name" {
  description = "Name of the traffic manager"
  type        = string
}

variable "tm_relative_dns_name" {
  description = "Relative DNS name for the traffic manager"
  type        = string
}

variable "tm_ttl_dns_config" {
  description = "TTL for DNS configuration in the traffic manager"
  type        = number
}

variable "tm_endpoints" {
  description = "List of endpoints for the traffic manager"
  type = map(object({
    name               = string
    target_resource_id = string
  }))
}