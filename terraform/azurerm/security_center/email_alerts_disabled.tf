# fails
# Ensure that 'Send email notification for high severity alerts' is set to 'On'Checkov CKV_AZURE_21
# Ensure that 'Send email notification for high severity alerts' is set to 'On'Checkov CKV_AZURE_22
# todo duplicates?
# todo ensure alert_notifications' is true

resource "azurerm_security_center_contact" "positive1" {
  email               = "contact@example.com"
  phone               = "+1-555-555-5555"
  alert_notifications = false
}
