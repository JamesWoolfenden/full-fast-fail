resource "azuread_user" "james_woolfenden" {
  department            = "Infrastructure"
  display_name          = "James Woolfenden"
  force_password_change = true
  given_name            = "James"
  job_title             = "Infrastructure Engineer"
  password              = "changeme-dy2xPjgW"
  surname               = "Woolfenden"
  user_principal_name   = "james.woolfenden@gmail.com"
}
