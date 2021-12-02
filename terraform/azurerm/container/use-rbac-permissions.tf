
resource "azurerm_kubernetes_cluster" "fail" {
  role_based_access_control {
    enabled = false
  }
}
