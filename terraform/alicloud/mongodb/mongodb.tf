# todo uses kms encrypted password kms_encrypted_password is set and not account_password
# todo encryption_context is set
resource "alicloud_mongodb_instance" "fail" {
  engine_version      = "3.4"
  db_instance_class   = "dds.mongo.mid"
  db_instance_storage = 10
  vswitch_id          = alicloud_vswitch.default.id
  security_ip_list    = ["10.168.1.12", "100.69.7.112"]
}
