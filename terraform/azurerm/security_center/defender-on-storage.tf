

resource "azurerm_security_center_subscription_pricing" "fail_storage" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
