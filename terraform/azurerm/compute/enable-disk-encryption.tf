
resource "azurerm_managed_disk" "fail" {
  encryption_settings {
    enabled = false
  }
}
