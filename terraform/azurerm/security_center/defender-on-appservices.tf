
resource "azurerm_security_center_subscription_pricing" "fail" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
