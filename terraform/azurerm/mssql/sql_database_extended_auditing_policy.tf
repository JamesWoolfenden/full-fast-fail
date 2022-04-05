# fail
# CKV_AZURE_24: "Specifies a retention period of less than 90 days."
# CKV_AZURE_156 Ensure default Auditing policy for a SQL Server is configured to capture and retain the activity logs
# todo Ensure default Auditing policy for a SQL Server is configured to capture and retain the activity logs (R.1.5)
resource "azurerm_mssql_database_extended_auditing_policy" "example" {
  database_id                             = azurerm_mssql_database.examplea.id
  storage_endpoint                        = azurerm_storage_account.examplea.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.examplea.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 89
  log_monitoring_enabled                  = false
}
