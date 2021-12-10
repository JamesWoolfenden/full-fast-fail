# fails
# CKV_AWS_181: "Ensure S3 Object Copy is encrypted by KMS using a customer managed Key (CMK)"

resource "aws_s3_object_copy" "fail" {
  bucket = "destination_bucket"
  key    = "destination_key"
  source = "source_bucket/source_key"

  grant {
    uri         = "http://acs.amazonaws.com/groups/global/AllUsers"
    type        = "Group"
    permissions = ["READ"]
  }
}
