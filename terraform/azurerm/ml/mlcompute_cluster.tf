#fails
#CKV_AZURE_150: "Ensure Machine Learning Compute Cluster Minimum Nodes Set To 0"
#CKV_AZURE_142: "Ensure Machine Learning Compute Cluster Local Authentication is disabled"
resource "azurerm_machine_learning_compute_cluster" "ckv_unittest_fail" {
  name                          = "example"
  location                      = "West Europe"
  vm_priority                   = "LowPriority"
  vm_size                       = "Standard_DS2_v2"
  machine_learning_workspace_id = azurerm_machine_learning_workspace.example.id
  subnet_resource_id            = azurerm_subnet.example.id

  scale_settings {
    min_node_count                       = 1
    max_node_count                       = 2
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }
}
