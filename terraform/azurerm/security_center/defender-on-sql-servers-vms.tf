

resource "azurerm_security_center_subscription_pricing" "fail_vms" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
