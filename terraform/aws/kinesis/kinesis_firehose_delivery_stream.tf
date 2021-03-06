# fails
# CKV_AWS_240 server_side_encryption = enabled
# CKV_AWS_241 customer_manage_CMK and key_arn is set
resource "aws_kinesis_firehose_delivery_stream" "test_stream" {
  name        = "terraform-kinesis-firehose-test-stream"
  destination = "s3"

  s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.bucket.arn
  }

  # server_side_encryption {
  #   enabled=true #default is false
  #   key_type="CUSTOMER_MANAGED_CMK"
  #   key_arn = aws_kms_key.example.arn
  # }
  tags = {
    test = "failed"
  }
}


resource "aws_s3_bucket" "bucket" {
  tags = {
    test = "failed"
  }
}

resource "aws_iam_role" "firehose_role" {
  assume_role_policy = ""
  tags = {
    test = "failed"
  }
}

resource "aws_kms_key" "example" {
  tags = {
    test = "failed"
  }
}
