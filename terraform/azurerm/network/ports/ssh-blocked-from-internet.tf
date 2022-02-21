# fails
# CKV_AZURE_10: "Ensure that SSH access is restricted from the internet"
resource "azurerm_network_security_rule" "fail_ssh" {
  name                       = "fail_security_rule"
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = ["22"]
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
