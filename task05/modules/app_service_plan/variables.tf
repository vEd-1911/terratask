variable "name" {
  description = "name of the app service plan"
  type        = string
}

variable "location" {
  description = "location of the app service plan"
  type        = string
}

variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
}

variable "os_type" {
  description = "operating system type for the app service plan"
  type        = string
}

variable "sku_name" {
  description = "sku name for the app service plan"
  type        = string
}

variable "worker_count" {
  description = "number of workers for the app service plan"
  type        = number
}

variable "tags" {
  description = "tags to be applied to the app service plan"
  type        = map(string)
}