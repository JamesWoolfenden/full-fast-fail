

resource "azurerm_security_center_subscription_pricing" "fail_mssql" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
