# fails
# CKV_AZURE_142
resource "azurerm_machine_learning_compute_cluster" "ckv_unittest_fail" {
  name                          = "example"
  location                      = "West Europe"
  vm_priority                   = "LowPriority"
  vm_size                       = "Standard_DS2_v2"
  machine_learning_workspace_id = azurerm_machine_learning_workspace.example.id
  local_auth_enabled            = true

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 1
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }

  identity {
    type = "SystemAssigned"
  }
}
