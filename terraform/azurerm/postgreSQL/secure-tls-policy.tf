# fails
# CKV_AZURE_147  ssl min is TLS1_2
resource "azurerm_postgresql_server" "fail_psql" {
  name = "fail"

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_1"
}
