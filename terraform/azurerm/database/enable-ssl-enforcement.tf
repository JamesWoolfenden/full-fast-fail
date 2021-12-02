
resource "azurerm_postgresql_server" "fail" {
  name = "fail"

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_2"
}
