#fails
# CKV_SECRET_6: "Base64 High Entropy String"
# CKV_AZURE_23: "Ensure that 'Auditing' is set to 'On' for SQL servers"
# CKV_AZURE_24: "Ensure that 'Auditing' Retention is 'greater than 90 days' for SQL servers"
# CKV2_AZURE_2: "Ensure that Vulnerability Assessment (VA) is enabled on a SQL server by setting a Storage Account"
# CKV2_AZURE_6: "Ensure 'Allow access to Azure services' for PostgreSQL Database Server is disabled"
# CKV2_AZURE_7: "Ensure that Azure Active Directory Admin is configured"
# CKV2_AZURE_13: "Ensure that sql servers enables data security policy"
# todo # CKV_AZURE_52: "Ensure MSSQL is using the latest version of TLS encryption" not triggered
# todo ensure infrastructure_encryption_enabled=false
resource "azurerm_sql_server" "example" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  minimum_tls_version          = "1.1"
  threat_detection_policy {
    enabled = false
  }

  public_network_access_enabled = true
  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }
  infrastructure_encryption_enabled = false

}
