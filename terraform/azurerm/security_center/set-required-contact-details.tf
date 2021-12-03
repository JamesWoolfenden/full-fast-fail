

resource "azurerm_security_center_contact" "fail" {
  email = "bad_contact@example.com"
  phone = ""

  alert_notifications = true
  alerts_to_admins    = true
}
