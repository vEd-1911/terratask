location                    = "eastus"
resource_group_name         = "cmaz-oer4x906-mod4-rg"
virtual_network_name        = "cmaz-oer4x906-mod4-vnet"
subnet_name                 = "frontend"
network_interface_name      = "cmaz-oer4x906-mod4-nic"
network_security_group_name = "cmaz-oer4x906-mod4-nsg"
nsg_inbound_http_rule = {
  name                       = "Allow-HTTP"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
nsg_inbound_ssh_rule = {
  name                       = "Allow-SSH"
  priority                   = 110
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
public_ip_name             = "cmaz-oer4x906-mod4-pip"
dns_name_label             = "cmaz-oer4x906-mod4-nginx"
virtual_machine_name       = "cmaz-oer4x906-mod4-vm"
virtual_machine_os_version = "ubuntu-24_04-lts"
virtual_machine_sku        = "Standard_B2s_v2"
tags = {
  Creator = "vedant_awasthi@epam.com"
}           