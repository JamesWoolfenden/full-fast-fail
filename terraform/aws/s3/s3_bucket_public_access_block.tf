# fail
# CKV2_AWS_6: "Ensure that S3 bucket has a Public Access block"
# CKV_AWS_56: "Ensure S3 bucket has 'restrict_public_bucket' enabled"
# CKV_AWS_55: "Ensure S3 bucket has ignore public ACLs enabled"
# CKV_AWS_54: "Ensure S3 bucket has block public policy enabled"
# CKV_AWS_53: "Ensure S3 bucket has block public ACLS enabled"

resource "aws_s3_bucket_public_access_block" "fail" {
  bucket = aws_s3_bucket.fail.id
  tags   = { test = "Fail" }
}
