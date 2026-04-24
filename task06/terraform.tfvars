name_prefix = "cmaz-oer4x906-mod6"

location = "North Europe"

tags = {
  Creator = "vedant_awasthi@epam.com"
}

# Existing Key Vault
key_vault_name = "cmaz-oer4x906-mod6-kv"
key_vault_rg   = "cmaz-oer4x906-mod6-kv-rg"

# SQL
sql_sku = "S2"



# App Service Plan
asp_sku = "P0v3"

os_type = "Linux"

# Web App
dotnet_version = "8.0"

allowed_ip_address = "18.153.146.156"

kv_secret_name_sql_admin_username = "sql-admin-name"
kv_secret_name_sql_admin_password = "sql-admin-password"

firewall_rule_name = "allow-verification-ip"