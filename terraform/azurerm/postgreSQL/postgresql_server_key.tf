# fails
# CKV2_AZURE_17: "Ensure that PostgreSQL server enables customer-managed key for encryption"
# todo tls
# todo ssl ssl_enforcement_enabled

resource "azurerm_postgresql_server_key" "not_ok" {
  name                             = "ok-pg-server"
  location                         = azurerm_resource_group.ok.location
  resource_group_name              = azurerm_resource_group.ok.name
  sku_name                         = "GP_Gen5_2"
  administrator_login              = "acctestun"
  administrator_login_password     = "H@Sh1CoR3!"
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_1"
  storage_mb                       = 51200
  version                          = "5.6"

  identity {
    type = "SystemAssigned"
  }
}
