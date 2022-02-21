
# fail
# Ensure that Virtual Machines use managed disksCheckov CKV_AZURE_92
# Ensure Virtual Machine Extensions are not InstalledCheckov CKV_AZURE_50
# todo predictable admin username
# ensure no password auth CKV_AZURE_149

resource "azurerm_linux_virtual_machine" "default" {
  admin_password                  = "admin"
  admin_username                  = "admin123"
  location                        = azurerm_resource_group.test.location
  name                            = "linux-vm"
  resource_group_name             = azurerm_resource_group.test.name
  size                            = "Standard_F2"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.test.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}


resource "azurerm_resource_group" "test" {
  name     = "test"
  location = "uksouth"
}

resource "azurerm_network_interface" "test" {
  name     = "example"
  location = azurerm_resource_group.test.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}


provider "azurerm" {
  features {}
}
