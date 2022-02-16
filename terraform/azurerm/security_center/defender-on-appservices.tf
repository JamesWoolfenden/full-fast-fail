
resource "azurerm_security_center_subscription_pricing" "fail_defender" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
