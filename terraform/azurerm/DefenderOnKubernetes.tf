
resource "azurerm_security_center_subscription_pricing" "example" {
  tier          = "Free"
  resource_type = "KubernetesService"
}
