
resource "azurerm_security_center_subscription_pricing" "example_oldvms" {
  tier          = "Free"
  resource_type = "SqlServerVirtualMachines"
}
