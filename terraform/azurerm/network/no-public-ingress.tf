
resource "azurerm_network_security_rule" "fail" {
  direction             = "Inbound"
  source_address_prefix = "0.0.0.0/0"
  access                = "Allow"
}
