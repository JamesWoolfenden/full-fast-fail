# fails
# Ensure that 'Send Alerts To' is enabled for MSSQL serversCheckov CKV_AZURE_26
# Ensure that 'Email service and co-administrators' is 'Enabled' for MSSQL serversCheckov CKV_AZURE_27
# Ensure that 'Threat Detection types' is set to 'All'Checkov CKV_AZURE_25
resource "azurerm_mssql_server_security_alert_policy" "fauk" {
  resource_group_name        = azurerm_resource_group.example.name
  server_name                = azurerm_sql_server.example.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  disabled_alerts = [
    "Sql_Injection",
    "Data_Exfiltration"
  ]
  retention_days = 20
}
