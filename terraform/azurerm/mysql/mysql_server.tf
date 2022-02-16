# fails
# Ensure that MySQL server enables infrastructure encryptionCheckov CKV_AZURE_96
# Ensure that My SQL server enables geo-redundant backupsCheckov CKV_AZURE_94
# Ensure 'public network access enabled' is set to 'False' for mySQL serversCheckov CKV_AZURE_53
# Ensure 'Enforce SSL connection' is set to 'ENABLED' for MySQL Database ServerCheckov CKV_AZURE_28
# Ensure that My SQL server enables Threat detection policyCheckov CKV_AZURE_127
# Ensure that MySQL server enables customer-managed key for encryptionCheckov CKV2_AZURE_16
resource "azurerm_mysql_server" "fail" {
  name = "fail"

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_2"

  threat_detection_policy {
    enabled = false
  }
}
