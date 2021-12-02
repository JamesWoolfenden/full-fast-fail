
resource "azurerm_mssql_server" "fail" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.1"
}

resource "azurerm_postgresql_server" "fail" {
  name = "fail"

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_1"
}
