# Fails
# todo disable rdp fail_range.destination_port_range' cannot be 3389"
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

resource "azurerm_network_security_rule" "fail_source_range" {
  name                        = "example"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "ALLOW"
  protocol                    = "tcp"
  source_port_range           = "22"
  destination_port_range      = "*"
  source_address_prefix       = "internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_rdp.name
}

# resource "azurerm_network_security_rule" "fail_ranges" {
#   name                        = "example"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_ranges = ["3389"]
#   destination_port_range      = "*"
#   source_address_prefix       = "internet"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.example.name
#   network_security_group_name = azurerm_network_security_group.example_rdp.name
# }

resource "azurerm_network_security_rule" "fail_rdp" {
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_rdp.name
  name                        = "fail_security_rule"
  direction                   = "INBOUND"
  access                      = "Allow"
  protocol                    = "tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  priority                    = 120
}

# Ensure that UDP Services are restricted from the Internet Checkov CKV_AZURE_77
resource "azurerm_network_security_group" "example_rdp" {
  name                = "tf-appsecuritygroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "rdp"
    priority                   = 100
    source_port_range          = "0-65535"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    protocol                   = "tcp"
  }
}

resource "azurerm_network_security_group" "example_rdp_range" {
  name                = "tf-appsecuritygroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "rdp"
    priority                   = 100
    source_port_range          = "0-65535"
    destination_port_range     = "100-4000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    protocol                   = "tcp"
  }
}

resource "azurerm_network_security_group" "example_rdp_ranges" {
  name                = "tf-appsecuritygroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "rdp"
    priority                   = 100
    source_port_range          = "0-65535"
    destination_port_range     = "100-4000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    protocol                   = "tcp"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "uksouth"

}

provider "azurerm" {
  features {}
}
