# todo fail egress to 0.0.0.0
# todo fail ingress to 0.0.0.0

resource "azurerm_network_security_rule" "fail_egress" {
  direction                  = "Outbound"
  destination_address_prefix = "0.0.0.0/0"
  access                     = "Allow"
}

resource "azurerm_network_security_rule" "fail_ingress" {
  direction             = "Inbound"
  source_address_prefix = "0.0.0.0/0"
  access                = "Allow"
}
