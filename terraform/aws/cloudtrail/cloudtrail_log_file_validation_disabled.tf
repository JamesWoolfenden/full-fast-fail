# fail
# Ensure CloudTrail logs are encrypted at rest using KMS CMKsCheckov CKV_AWS_35
# Ensure CloudTrail log file validation is enabledCheckov CKV_AWS_36
# Ensure CloudTrail is enabled in all RegionsCheckov CKV_AWS_67
# Ensure CloudTrail trails are integrated with CloudWatch LogsCheckov CKV2_AWS_10

resource "aws_cloudtrail" "fail" {
  name           = "positive1"
  s3_bucket_name = "bucketlog1"
}

resource "aws_cloudtrail" "fail2" {
  name                       = "positive2"
  s3_bucket_name             = "bucketlog2"
  enable_log_file_validation = false
}
