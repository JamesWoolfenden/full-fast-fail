# fails
# Ensure Azure Instance does not use basic authentication(Use SSH Key Instead)Checkov CKV_AZURE_1
# Ensure that Microsoft Antimalware is configured to automatically updates for Virtual MachinesCheckov CKV2_AZURE_10
# Ensure Virtual Machines are utilizing Managed DisksCheckov CKV2_AZURE_9
# Ensure that virtual machines are backed up using Azure BackupCheckov CKV2_AZURE_12
# todo ensure network_interface_ids' list is not empty
resource "azurerm_virtual_machine" "positive1" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = []
  vm_size               = "Standard_DS1_v2"

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
