

resource "azurerm_security_center_subscription_pricing" "fail_vault" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
