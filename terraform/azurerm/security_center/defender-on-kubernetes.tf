
resource "azurerm_security_center_subscription_pricing" "fail_k8s" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}
