# Fails

resource "azurerm_network_security_rule" "positive10" {
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

resource "azurerm_resource_group" "example" {
  location = "uksouth"
  name     = "examplea"
}

resource "azurerm_network_security_group" "example" {
  name                = "jimbo"
  resource_group_name = azurerm_resource_group.example.name
  location            = "uksouth"
}

provider "azurerm" {
  features {}
}
