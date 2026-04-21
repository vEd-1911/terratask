module "RG" {
  source = "./modules/resource_group"

  for_each = var.rg_name

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "ASP" {
  source              = "./modules/app_service_plan"
  for_each            = var.app_service_plan
  name                = each.value.name
  location            = module.RG[each.value.resource_group_key].location
  resource_group_name = module.RG[each.value.resource_group_key].name
  worker_count        = each.value.worker_count
  sku_name            = each.value.sku
  os_type             = each.value.os_type
  tags                = var.tags
}

module "APP" {
  source              = "./modules/app_service"
  for_each            = var.app_service
  name                = each.value.name
  location            = module.RG[each.value.resource_group_key].location
  resource_group_name = module.RG[each.value.resource_group_key].name
  app_service_plan_id = module.ASP[each.value.app_service_plan_key].id
  tags                = var.tags
  ip_restrictions     = var.ip_restrictions
}

module "TM" {
  source = "./modules/traffic_manager"

  resource_group_name    = module.RG[var.traffic_manager.resource_group_key].name
  traffic_routing_method = var.traffic_manager.traffic_routing_method
  tm_name                = var.traffic_manager.tm_name
  tm_ttl_dns_config      = var.traffic_manager.tm_ttl_dns_config
  tm_relative_dns_name   = var.traffic_manager.tm_relative_dns_name

  tm_endpoints = {
    for app_key, app in module.APP :
    app_key => {
      name               = app.name
      target_resource_id = module.APP[app_key].id
    }
  }

  tags = var.tags

}