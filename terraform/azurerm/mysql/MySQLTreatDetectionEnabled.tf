# fails
# Ensure that MySQL server enables infrastructure encryption Checkov CKV_AZURE_96
# Ensure that My SQL server enables geo-redundant backup sCheckov CKV_AZURE_94
# Ensure 'public network access enabled' is set to 'False' for mySQL servers Checkov CKV_AZURE_53
# Ensure MySQL is using the latest version of TLS encryption Checkov CKV_AZURE_54
# Ensure 'Enforce SSL connection' is set to 'ENABLED' for MySQL Database Server Checkov CKV_AZURE_28
# Ensure that My SQL server enables Threat detection policy Checkov CKV_AZURE_127
# Ensure that MySQL server enables customer-managed key for encryption Checkov CKV2_AZURE_16
resource "azurerm_mysql_server" "example" {
  name                = "example-mysqlserver"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLS1_1"

  threat_detection_policy {
    enabled = false
  }
}
