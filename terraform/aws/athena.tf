#fails
# CKV_AWS_82: "Ensure Athena Workgroup should enforce configuration to prevent client disabling encryption"
# CKV_AWS_159: "Ensure that Athena Workgroup is encrypted"
resource "aws_athena_workgroup" "fail" {
  name = "wg-non-encrypted"

  configuration {
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
    }
  }
}
