# todo encrypt_type is 1 or  2 i
resource "alicloud_nas_file_system" "fail" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "tf-testAccNasConfig"
  encrypt_type  = "0"
}

resource "alicloud_nas_file_system" "fail2" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "tf-testAccNasConfig"
  encrypt_type  = "1"
}

resource "alicloud_nas_file_system" "pass" {
  protocol_type    = "NFS"
  storage_type     = "Performance"
  description      = "tf-testAccNasConfig"
  encrypt_type     = "2"
  file_system_type = "extreme"
}
