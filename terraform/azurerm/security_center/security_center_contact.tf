# fails
# CKV_AZURE_131: "Ensure that 'Security contact emails' is set"
# CKV_AZURE_20: "Ensure that security contact 'Phone number' is set"
# CKV_AZURE_22: "Ensure that 'Send email notification for high severity alerts' is set to 'On'"
# CKV_AZURE_21: "Ensure that 'Send email notification for high severity alerts' is set to 'On'"

resource "azurerm_security_center_contact" "fail" {
  # email = "fail@example.com"
  # phone = "+1-555-555-5555"

  alert_notifications = false
  alerts_to_admins    = false
}
