resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"
  versioning {
    enabled = var.enabled
  }
}

variable "enabled" {
  default=""
}
