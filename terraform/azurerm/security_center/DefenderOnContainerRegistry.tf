
resource "azurerm_security_center_subscription_pricing" "container_example" {
  tier          = "Free"
  resource_type = "ContainerRegistry"
}
