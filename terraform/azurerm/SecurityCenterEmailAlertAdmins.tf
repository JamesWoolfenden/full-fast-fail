
resource "azurerm_security_center_contact" "example" {
  email            = "contact@example.com"
  alerts_to_admins = false
}
