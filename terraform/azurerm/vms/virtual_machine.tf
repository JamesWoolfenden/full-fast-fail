# fails
# Ensure Azure Instance does not use basic authentication(Use SSH Key Instead)Checkov CKV_AZURE_1
# Ensure that Microsoft Antimalware is configured to automatically updates for Virtual MachinesCheckov CKV2_AZURE_10
# Ensure that virtual machines are backed up using Azure BackupCheckov CKV2_AZURE_12
# Ensure Virtual Machines are utilizing Managed DisksCheckov CKV2_AZURE_9
# Ensure that no sensitive credentials are exposed in VM custom_dataCheckov CKV_AZURE_45

#legacy resource

resource "azurerm_virtual_machine" "fail" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
    custom_data    = <<EOF
0000-0000-0000-0000-000000000000
EOF
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}
