

resource "azurerm_network_watcher_flow_log" "bad_watcher" {
  network_watcher_name = "bad_watcher"
  resource_group_name  = "resource-group"

  network_security_group_id = azurerm_network_security_group.test.id
  storage_account_id        = azurerm_storage_account.test.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 7
  }
}
