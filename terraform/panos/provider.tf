# fails
# CKV_PAN_1: "Ensure no hard coded PAN-OS credentials exist in provider"
provider "panos" {
  api_key  = var.nested_var.apikey
  password = var.password
}


variable "password" {
  default = "nevershouldexist"
}
