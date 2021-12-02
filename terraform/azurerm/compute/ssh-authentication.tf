
resource "azurerm_virtual_machine" "fail" {
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
