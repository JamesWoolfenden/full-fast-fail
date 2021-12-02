

resource "azurerm_linux_virtual_machine" "bad_linux_example" {
  name                            = "bad-linux-machine"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "somePassword"
  disable_password_authentication = false
}
