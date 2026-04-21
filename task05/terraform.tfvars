rg_name = {
  RG1 = {
    name     = "cmaz-oer4x906-mod5-rg-01"
    location = "eastus"
  }

  RG2 = {
    name     = "cmaz-oer4x906-mod5-rg-02"
    location = "westus"
  }

  RG3 = {
    name     = "cmaz-oer4x906-mod5-rg-03"
    location = "centralus"
  }
}

tags = {
  Creator = "vedant_awasthi@epam.com"
}

app_service_plan = {
  ASP1 = {
    name               = "cmaz-oer4x906-mod5-asp-01"
    resource_group_key = "RG1"
    worker_count       = 2
    sku                = "S1"
    os_type            = "Windows"
  }

  ASP2 = {
    name               = "cmaz-oer4x906-mod5-asp-02"
    resource_group_key = "RG2"
    worker_count       = 1
    sku                = "S1"
    os_type            = "Windows"
  }

}

app_service = {
  APP1 = {
    name                 = "cmaz-oer4x906-mod5-app-01"
    resource_group_key   = "RG1"
    app_service_plan_key = "ASP1"
  }

  APP2 = {
    name                 = "cmaz-oer4x906-mod5-app-02"
    resource_group_key   = "RG2"
    app_service_plan_key = "ASP2"
  }
}

ip_restrictions = [{
  name       = "allow-ip"
  priority   = 100
  action     = "Allow"
  ip_address = "18.153.146.156"


  },
  {
    name        = "allow-tm"
    priority    = 110
    action      = "Allow"
    service_tag = "AzureTrafficManager"
  },
  {
    name       = "Deny all"
    priority   = 2147483647
    action     = "Deny"
    ip_address = "0.0.0.0"
  }
]

traffic_manager = {

  tm_name                = "cmaz-oer4x906-mod5-traf"
  resource_group_key     = "RG3"
  traffic_routing_method = "Performance"
  tm_ttl_dns_config      = 30
  tm_relative_dns_name   = "tm1"

}
