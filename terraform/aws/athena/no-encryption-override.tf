# fail
# tfsec
# AWS060 Resource 'aws_athena_workgroup.fail' has enforce_workgroup_configuration set to false.
# Clients can ignore encryption requirements


resource "aws_athena_workgroup" "fail" {
  name = "example"

  configuration {
    //enforce_workgroup_configuration    = true
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.example.bucket}/output/"

      # encryption_configuration {
      #   encryption_option = "SSE_KMS"
      #   kms_key_arn       = aws_kms_key.example.arn
      # }
    }

  }
}
