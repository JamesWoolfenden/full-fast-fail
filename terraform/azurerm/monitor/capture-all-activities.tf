

resource "azurerm_monitor_log_profile" "fail" {
  name = "fail"

  categories = []

  retention_policy {
    enabled = true
    days    = 7
  }
}
