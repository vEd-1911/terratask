variable "rg_name" {
  description = "Name of the resource group"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plan" {
  description = "Name of the app service plan"
  type = map(object({
    name               = string
    resource_group_key = string
    worker_count       = number
    sku                = string
    os_type            = string
  }))
}

variable "app_service" {
  description = "Name of the app service"
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}

variable "traffic_manager" {
  description = "Name of the traffic manager"
  type = map(object({
    tm_name                = string
    resource_group_key     = string
    traffic_routing_method = string
    tm_ttl_dns_config      = number
    tm_relative_dns_name   = string
  }))
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

variable "ip_restrictions" {
  description = "List of IP restrictions for the app service"
  type = list(object({
    name     = string
    priority = number
    action   = string

    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}
