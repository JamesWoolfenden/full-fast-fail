#fails
# CKV_AWS_82: "Ensure Athena Workgroup should enforce configuration to prevent client disabling encryption"
# CKV_AWS_159: "Ensure that Athena Workgroup is encrypted"

# tfsec
# AWS059 Resource 'aws_athena_workgroup.fail' missing encryption configuration block
# AWS060 Resource 'aws_athena_workgroup.fail' has enforce_workgroup_configuration set to false.

resource "aws_athena_workgroup" "fail" {
  name = "wg-non-encrypted"

  configuration {
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = false

    result_configuration {
      output_location = "s3://mys3bucket"
    }
  }
  tags = { test = "fail" }
}
