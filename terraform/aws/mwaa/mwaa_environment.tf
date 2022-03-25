# fails
# todo aws_mwaa_environment kms_key is set
# Ensure MWAA environment has scheduler logs enabledCheckov (CKV_AWS_242)
# Ensure MWAA environment has worker logs enabledCheckov (CKV_AWS_243)
resource "aws_mwaa_environment" "example" {
  dag_s3_path        = "dags/"
  execution_role_arn = aws_iam_role.example.arn
  name               = "example"

  network_configuration {
    security_group_ids = [aws_security_group.example.id]
    subnet_ids         = aws_subnet.private[*].id
  }

  source_bucket_arn = aws_s3_bucket.example.arn

  tags = {
    Name        = "example"
    Environment = "production"
  }
}
