# Setting the http attribute to true turns on HTTP for management, and is therefore a fail, we only want to see HTTPS in use
resource "panos_management_profile" "fail" {
  name = "my-mgmt-profile"
  http = true
}

