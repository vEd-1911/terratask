variable "name" {
  description = "name of the web app"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string

}

variable "location" {
  description = "location of the web app"
  type        = string
}

variable "app_service_plan_id" {
  description = "id of the app service plan"
  type        = string
}

variable "tags" {
  description = "tags to be applied to the web app"
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