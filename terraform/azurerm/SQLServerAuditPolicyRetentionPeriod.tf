
resource "azurerm_mssql_database_extended_auditing_policy" "example" {
  database_id                             = azurerm_mssql_database.examplea.id
  storage_endpoint                        = azurerm_storage_account.examplea.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.examplea.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 89
}
