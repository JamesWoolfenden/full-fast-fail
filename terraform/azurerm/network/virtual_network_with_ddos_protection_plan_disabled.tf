# fails
# todo ddos_protection_plan' is defined and not null - not disabled
resource "azurerm_resource_group" "example_ddos" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example_ddos" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example_ddos.location
  resource_group_name = azurerm_resource_group.example_ddos.name
}

resource "azurerm_network_ddos_protection_plan" "example_ddos" {
  name                = "ddospplan1"
  location            = azurerm_resource_group.example_ddos.location
  resource_group_name = azurerm_resource_group.example_ddos.name
}

resource "azurerm_virtual_network" "example_ddos" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.example_ddos.location
  resource_group_name = azurerm_resource_group.example_ddos.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.example_ddos.id
  }

  tags = {
    environment = "Production"
  }
}
