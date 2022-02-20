# fails
# todo predictable admin account name .administrator_login
# {"admin", "administrator", "sqladmin", "root", "user", "azure_admin", "azure_administrator", "guest"}

resource "azurerm_sql_server" "positive1rg" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.positive1rg.name
  location                     = azurerm_resource_group.positive1rg.location
  version                      = "12.0"
  administrator_login          = ""
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.positive1rg.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.positive1rg.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = {
    environment = "production"
  }
}
