resource "aws_s3_bucket" "fail" {
  acl    = "public-read-write"
  bucket = "superfail"

  versioning {
    enabled    = false
    mfa_delete = false
  }

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddCannedAcl",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:PutObject","s3:PutObjectAcl"],
      "Resource":"arn:aws:s3:::superfail/*"
    },
    {
        "Principal": {
            "AWS": ["*"],
            "Effect": "Deny",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "*"
            ]
        }
    }
  ]
}
POLICY
}
