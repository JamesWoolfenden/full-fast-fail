# Setting the telnet attribute to true turns on Telnet for management, and is therefore a fail, we only want to see SSH in use
resource "panos_management_profile" "fail_telnet" {
  name   = "my-mgmt-profile"
  telnet = true
}
