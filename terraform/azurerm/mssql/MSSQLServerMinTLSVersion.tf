# fails
# CKV_AZURE_24: "Ensure that 'Auditing' Retention is 'greater than 90 days' for SQL servers"
# CKV_AZURE_52: "Ensure MSSQL is using the latest version of TLS encryption"
# CKV_AZURE_23: "Ensure that 'Auditing' is set to 'On' for SQL servers"

resource "azurerm_mssql_server" "examplea" {
  name                          = var.server_name
  resource_group_name           = var.resource_group.name
  location                      = var.resource_group.location
  version                       = var.sql["version"]
  administrator_login           = var.sql["administrator_login"]
  administrator_login_password  = local.administrator_login_password
  minimum_tls_version           = "1.1"
  public_network_access_enabled = var.sql["public_network_access_enabled"]
  identity {
    type = "SystemAssigned"
  }
  tags = var.common_tags
}
