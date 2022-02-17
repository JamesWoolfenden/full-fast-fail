# fails
# CKV_AWS_181: "Ensure S3 Object Copy is encrypted by KMS using a customer managed Key (CMK)"

resource "aws_s3_object_copy" "fail" {
  bucket = "destination_bucket"
  key    = "destination_key"
  source = "arn:aws:s3:us-west-2:9999912999:accesspoint/my-access-point/object/testbucket/test1.json"

  grant {
    uri         = "http://acs.amazonaws.com/groups/global/AllUsers"
    type        = "Group"
    permissions = ["READ"]
  }
  tags = { test = "Fail" }
}
