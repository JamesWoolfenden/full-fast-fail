# fails
# todo ssh
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

resource "azurerm_network_security_group" "fail_ssh" {
  name                = "tf-appsecuritygroup"
  location            = azurerm_resource_group.fail_ssh.location
  resource_group_name = azurerm_resource_group.fail_ssh.name

  security_rule {
    source_port_range          = "any"
    destination_port_range     = ["22"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_network_security_rule" "fail_ssh2" {
  name                        = "example"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.fail_ssh.name
  network_security_group_name = azurerm_network_security_group.fail_ssh.name
}
