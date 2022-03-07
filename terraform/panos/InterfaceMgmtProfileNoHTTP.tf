# fails
# Ensure plain-text management HTTP is not enabled for an Interface Management ProfileCheckov (CKV_PAN_2)
# Setting the http attribute to true turns on HTTP for management, and is therefore a fail, we only want to see HTTPS in use
resource "panos_management_profile" "fail" {
  name = "my-mgmt-profile"
  http = true
}
