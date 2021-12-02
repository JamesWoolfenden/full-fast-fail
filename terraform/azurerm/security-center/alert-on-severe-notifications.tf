

resource "azurerm_security_center_contact" "fail" {
  email = "fail@example.com"
  phone = "+1-555-555-5555"

  alert_notifications = false
  alerts_to_admins    = false
}
