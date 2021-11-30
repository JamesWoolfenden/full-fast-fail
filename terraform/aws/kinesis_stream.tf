
resource "aws_kinesis_stream" "fail" {
  name        = "test_stream-%[1]d"
  shard_count = 1
}
