# fails
# todo ensure enable logging is not false- disabled - enable logging defaults to true
resource "aws_cloudtrail" "positive1" {
  name                          = "positive"
  s3_bucket_name                = "bucketlog"
  enable_logging                = false
}