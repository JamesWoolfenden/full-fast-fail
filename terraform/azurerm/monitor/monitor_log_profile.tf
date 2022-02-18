# fails
# Ensure audit profile captures all the activities Checkov CKV_AZURE_38
# Ensure that Activity Log Retention is set 365 days or greater Checkov CKV_AZURE_37

resource "azurerm_monitor_log_profile" "fail_profile" {
  name = "fail"

  retention_policy {
    enabled = true
    days    = 7
  }
}
