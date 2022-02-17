# fails
# CKV_AWS_160: "Ensure that Timestream database is encrypted with KMS CMK"
resource "aws_timestreamwrite_database" "default" {
  database_name = "timestream"
  tags          = { test = "fail" }
}
