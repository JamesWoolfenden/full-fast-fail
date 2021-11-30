resource "aws_emr_security_configuration" "fail" {
  name = "fail"

  configuration = <<EOF
{
  "EncryptionConfiguration": {
    "EnableAtRestEncryption": true,
    "AtRestEncryptionConfiguration": {
      "S3EncryptionConfiguration": {
        "EncryptionMode": "SSE-S3"
      },
      "LocalDiskEncryptionConfiguration": {
        "EncryptionKeyProviderType": "AwsS3"
      }
    }
  }
}
EOF
}
