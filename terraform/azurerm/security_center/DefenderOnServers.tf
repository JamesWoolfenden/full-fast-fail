
resource "azurerm_security_center_subscription_pricing" "example_servers" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
