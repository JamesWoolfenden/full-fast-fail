
resource "azurerm_security_center_subscription_pricing" "fail_sql" {
  tier          = "Free"
  resource_type = "AppServices"
}
