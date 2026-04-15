variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
  default     = "cmaz-oer4x906-mod3-rg"
}

variable "virtual_network_name" {
  description = "Name of the virtual network to create"
  type        = string
  default     = "cmaz-oer4x906-mod3-vnet"
}

variable "storage_account_name" {
  description = "Name of the storage account to create"
  type        = string
  default     = "cmazoer4x906sa"
}

variable "subnet-1_name" {
  description = "Name of the subnet to create"
  type        = string
  default     = "frontend"
}

variable "subnet-2_name" {
  description = "Name of the subnet to create"
  type        = string
  default     = "backend"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Creator = "vedant_awasthi@rpam.com"
  }
}