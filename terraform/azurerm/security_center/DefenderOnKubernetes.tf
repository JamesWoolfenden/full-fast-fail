
resource "azurerm_security_center_subscription_pricing" "example_k8s" {
  tier          = "Free"
  resource_type = "KubernetesService"
}
