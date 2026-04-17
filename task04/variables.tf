variable "location" {
  description = "Location for resource deployment"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my-resource-group"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "my-virtual-network"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "my-subnet"
}

variable "network_interface_name" {
  description = "Name of the network interface"
  type        = string
  default     = "my-network-interface"
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "my-network-security-group"
}

variable "nsg_inbound_http_rule" {
  description = "Configuration for NSG inbound HTTP rule"
  type = object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })
  default = {
    name                       = "Allow-HTTP-Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

variable "nsg_inbound_ssh_rule" {
  description = "Configuration for NSG inbound SSH rule"
  type = object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })
  default = {
    name                       = "Allow-SSH-Inbound"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
  default     = "my-public-ip"
}

variable "dns_name_label" {
  description = "DNS name label for the public IP address"
  type        = string
  default     = "mydnslabel"
}

variable "virtual_machine_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "my-virtual-machine"
}

variable "virtual_machine_os_version" {
  description = "OS version for the virtual machine"
  type        = string
  default     = "UbuntuLTS"
}

variable "virtual_machine_sku" {
  description = "SKU for the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Creator = "vedantawasthi"
  }
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "vm_password" {
  description = "Password for the virtual machine admin user"
  type        = string
  sensitive   = true
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration for the network interface"
  type        = string
  default     = "ipconfig1"
}