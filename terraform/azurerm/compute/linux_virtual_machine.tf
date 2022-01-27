
# fails
# CKV_SECRET_6
# CKV_AZURE_1: "Ensure Azure Instance does not use basic authentication(Use SSH Key Instead)"
# CKV_AZURE_50: "Ensure Virtual Machine Extensions are not Installed"
# tfsec
# general-secrets-sensitive-in-attribute
# azure-compute-disable-password-authentication
resource "azurerm_linux_virtual_machine" "bad_linux_example" {
  name                            = "bad-linux-machine"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "somePassword"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.main.id]
  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "None"
  }
}


resource "azurerm_resource_group" "example" {
  location = "uksouth"
  name     = "secretsstash"
}
