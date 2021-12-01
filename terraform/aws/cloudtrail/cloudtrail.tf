# fail
# CKV_AWS_36: "Ensure CloudTrail log file validation is enabled"
# CKV_AWS_67: "Ensure CloudTrail is enabled in all Regions"
# CKV_AWS_35: "Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
# CKV2_AWS_10: "Ensure CloudTrail trails are integrated with CloudWatch Logs"

# tfsec
# AWS063 Resource 'aws_cloudtrail.fail' does not set multi region trail config.
# AWS065 Resource 'aws_cloudtrail.fail' does not have a kms_key_id set.
# AWS064 Resource 'aws_cloudtrail.fail' does not enable log file validation.

resource "aws_cloudtrail" "fail" {
  name                          = "TRAIL"
  s3_bucket_name                = aws_s3_bucket.test.id
  include_global_service_events = true
}
