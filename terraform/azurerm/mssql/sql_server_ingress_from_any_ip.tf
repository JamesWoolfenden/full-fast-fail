# # fails
# Ensure no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)Checkov CKV_AZURE_11
resource "azurerm_sql_firewall_rule" "fail" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
