# fails
# Alibaba Cloud OSS bucket accessible to publicCheckov (CKV_ALI_1)
# CKV_ALI_10: "Ensure OSS bucket has versioning enabled"
# CKV_ALI_6: "Ensure OSS bucket is encrypted with Customer Master Key"
# CKV_ALI_12: "Ensure the OSS bucket has access logging enabled"
resource "alicloud_oss_bucket" "bad_bucket" {
  bucket = "bucket-170309-acl"
  acl    = "public-read-write"
}
