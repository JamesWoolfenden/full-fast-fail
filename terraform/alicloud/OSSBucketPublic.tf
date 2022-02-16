
resource "alicloud_oss_bucket" "bad-bucket" {
  bucket = "bucket-170309-acl"
  acl    = "public-read-write"
}
