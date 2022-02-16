# Fails
# todo diasble rdp fail_range.destination_port_range' cannot be 3389"
resource "azurerm_network_security_rule" "fail_range" {
  name                        = "example"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "2000-4430"
  source_address_prefix       = "internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_security_rule" "fail_rdp" {
  name                       = "fail_security_rule"
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = ["3389"]
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_group" "example_drp" {
  name                = "tf-appsecuritygroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    source_port_range          = "any"
    destination_port_range     = ["3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
