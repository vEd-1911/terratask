locals {
  rg_name       = join("-", [var.name_prefix, "rg"])
  redis_name    = join("-", [var.name_prefix, "redis"])
  keyvault_name = join("-", [var.name_prefix, "kv"])
  aci_name      = join("-", [var.name_prefix, "ci"])
  aks_name      = join("-", [var.name_prefix, "aks"])
  acr_name      = "cmtroer4x906mod8cr"
  image_name    = var.docker_image_name

}