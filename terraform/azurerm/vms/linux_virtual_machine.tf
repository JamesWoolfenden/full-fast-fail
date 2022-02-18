
# fail
# Ensure that Virtual Machines use managed disksCheckov CKV_AZURE_92
# Ensure Virtual Machine Extensions are not InstalledCheckov CKV_AZURE_50
resource "azurerm_linux_virtual_machine" "default" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "linux-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  # os_disk {
  #   caching              = "ReadWrite"
  #   storage_account_type = "Standard_LRS"
  # }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    vhd_uri           = "someURI"
  }
}
