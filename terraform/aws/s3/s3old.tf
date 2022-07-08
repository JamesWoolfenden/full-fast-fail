# fail
# CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
# CKV_AWS_57: "S3 Bucket has an ACL defined which allows public WRITE access."
# CKV_AWS_145: "Ensure that S3 buckets are encrypted with KMS by default"
# CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"
# CKV_AWS_143: "Ensure that S3 bucket has lock configuration enabled by default"
# CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
# CKV_AWS_20: "S3 Bucket has an ACL defined which allows public READ access."
# CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"

resource "aws_s3_bucket" "fail" {
  acl    = "public-read-write"
  bucket = "superfail"

  #checkov:skip=CKV_AWS_1
  versioning {
    enabled    = false
    mfa_delete = false
  }

  object_lock_configuration {
    object_lock_enabled = false
  }

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Principal": {
        "AWS": "*"
      },
      "Effect": "Deny",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
POLICY
  tags   = { test = "Fail" }
}
