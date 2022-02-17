
resource "azurerm_security_center_subscription_pricing" "example_defender" {
  tier          = "Free"
  resource_type = "AppServices"
}
