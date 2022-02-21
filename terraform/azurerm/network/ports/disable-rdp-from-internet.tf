# Fails
# CKV_AZURE_9: "Ensure that RDP access is restricted from the internet"
resource "azurerm_network_security_rule" "fail_range" {
  name                        = "example"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "tcp"
  source_port_range           = "*"
  destination_port_range      = "2000-4430"
  source_address_prefix       = "internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_rdp.name
}
