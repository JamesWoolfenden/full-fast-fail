#fails
# Ensure that SQL server disables public network accessCheckov CKV_AZURE_113
# Ensure that 'Auditing' is set to 'On' for SQL serversCheckov CKV_AZURE_23
# Ensure that 'Auditing' Retention is 'greater than 90 days' for SQL serversCheckov CKV_AZURE_24
# Ensure MSSQL is using the latest version of TLS encryptionCheckov CKV_AZURE_52
resource "azurerm_mssql_server" "example" {
  name                          = "mssqlserver"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  version                       = "12.0"
  administrator_login           = "missadministrator"
  administrator_login_password  = "thisIsKat11"
  minimum_tls_version           = "1.1"
  public_network_access_enabled = true

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
