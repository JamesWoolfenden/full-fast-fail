# fails
# CKV_AZURE_25: "Ensure that 'Threat Detection types' is set to 'All'"
# CKV_AZURE_26: "Ensure that 'Send Alerts To' is enabled for MSSQL servers"
# CKV_AZURE_27: "Ensure that 'Email service and co-administrators' is 'Enabled' for MSSQL servers"

resource "azurerm_mssql_server_security_alert_policy" "fail" {
  resource_group_name        = azurerm_resource_group.example.name
  server_name                = azurerm_sql_server.example.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  disabled_alerts = [
    "Sql_Injection",
    "Data_Exfiltration"
  ]
  email_account_admins = false
  retention_days       = 20
  email_addresses      = []
}
