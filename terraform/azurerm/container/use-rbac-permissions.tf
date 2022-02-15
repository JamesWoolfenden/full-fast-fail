
resource "azurerm_kubernetes_cluster" "fail_rbac" {
  role_based_access_control {
    enabled = false
  }
}
