
resource "azurerm_security_center_subscription_pricing" "example_free" {
  tier          = "Free"
  resource_type = "SqlServers"
}
