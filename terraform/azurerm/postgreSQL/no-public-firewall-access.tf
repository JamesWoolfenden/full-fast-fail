# fails
# Ensure no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)Checkov CKV_AZURE_11

resource "azurerm_sql_firewall_rule" "fail" {
  name                = "bad_rule"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_postgresql_firewall_rule" "fail" {
  name                = "fail"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
