# fails
# todo
# kms_encrypted - (Optional) Boolean value if true to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Defaults to false.
# kms_key_arn - (Optional) Amazon Resource Name (ARN) for KMS key used for Amazon S3 server side encryption. This value can only be set when kms_encrypted is true.

resource "aws_storagegateway_smb_file_share" "example" {
  authentication = "GuestAccess"
  gateway_arn    = aws_storagegateway_gateway.example.arn
  location_arn   = aws_s3_bucket.example.arn
  role_arn       = aws_iam_role.example.arn
  tags           = { test = "fail" }
}
