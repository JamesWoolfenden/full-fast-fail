
resource "azurerm_monitor_log_profile" "fail" {
  name = "fail"

  categories = []

  locations = [
    "westus",
    "global",
  ]

  retention_policy {
    enabled = true
    days    = 7
  }
}
