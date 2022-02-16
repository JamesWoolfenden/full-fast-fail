
resource "alicloud_oss_bucket" "bad_bucket" {
  bucket = "bucket-170309-acl"
  acl    = "public-read-write"
}
