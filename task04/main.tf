resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_public_ip" "pip-1" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = var.dns_name_label

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_security_rule" "http_inbound" {
  name                        = var.nsg_inbound_http_rule.name
  priority                    = var.nsg_inbound_http_rule.priority
  direction                   = var.nsg_inbound_http_rule.direction
  access                      = var.nsg_inbound_http_rule.access
  protocol                    = var.nsg_inbound_http_rule.protocol
  source_port_range           = var.nsg_inbound_http_rule.source_port_range
  destination_port_range      = var.nsg_inbound_http_rule.destination_port_range
  source_address_prefix       = var.nsg_inbound_http_rule.source_address_prefix
  destination_address_prefix  = var.nsg_inbound_http_rule.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  depends_on = [azurerm_network_security_group.nsg]
}

resource "azurerm_network_security_rule" "ssh_inbound" {
  name                        = var.nsg_inbound_ssh_rule.name
  priority                    = var.nsg_inbound_ssh_rule.priority
  direction                   = var.nsg_inbound_ssh_rule.direction
  access                      = var.nsg_inbound_ssh_rule.access
  protocol                    = var.nsg_inbound_ssh_rule.protocol
  source_port_range           = var.nsg_inbound_ssh_rule.source_port_range
  destination_port_range      = var.nsg_inbound_ssh_rule.destination_port_range
  source_address_prefix       = var.nsg_inbound_ssh_rule.source_address_prefix
  destination_address_prefix  = var.nsg_inbound_ssh_rule.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  depends_on = [azurerm_network_security_group.nsg]
}

resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-1.id
  }
  tags       = var.tags
  depends_on = [azurerm_resource_group.rg, azurerm_subnet.subnet, azurerm_public_ip.pip-1]
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [azurerm_network_interface.nic, azurerm_network_security_group.nsg]
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.virtual_machine_sku
  admin_username      = var.admin_username
  admin_password      = var.vm_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = var.virtual_machine_os_version
    sku       = "server"
    version   = "latest"
  }

  tags = var.tags

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
    connection {
      type     = "ssh"
      host     = azurerm_public_ip.pip-1.ip_address
      user     = var.admin_username
      password = var.vm_password
    }
  }

  depends_on = [azurerm_network_interface.nic]
}

