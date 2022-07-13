# fails
# todo uses kms encrypted password kms_encrypted_password is set and not account_password
# todo encryption_context is set
# CKV_ALI_10: "Ensure OSS bucket has versioning enabled"
# CKV_ALI_6: "Ensure OSS bucket is encrypted with Customer Master Key"
# CKV_ALI_12: "Ensure the OSS bucket has access logging enabled"
# CKV_ALI_1: "Alibaba Cloud OSS bucket accessible to public"
# CKV_ALI_11: "Ensure OSS bucket has transfer Acceleration enabled"
resource "alicloud_mongodb_instance" "fail" {
  engine_version      = "3.4"
  db_instance_class   = "dds.mongo.mid"
  db_instance_storage = 10
  vswitch_id          = alicloud_vswitch.default.id
  security_ip_list    = ["10.168.1.12", "100.69.7.112"]
}
