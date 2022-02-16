
resource "azurerm_security_center_subscription_pricing" "fail_registry" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
