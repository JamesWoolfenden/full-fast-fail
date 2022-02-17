# fails
# CKV_AWS_185: "Ensure Kinesis Stream is encrypted by KMS using a customer managed Key (CMK)"
# CKV_AWS_43: "Ensure Kinesis Stream is securely encrypted"

# tfsec
# AWS024 Resource 'aws_kinesis_stream.fail' defines an unencrypted Kinesis Stream.

resource "aws_kinesis_stream" "fail" {
  name        = "test_stream-%[1]d"
  shard_count = 1
  tags        = { test = "Fail" }
}
