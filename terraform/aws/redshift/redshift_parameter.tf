# fail
# CKV_AWS_105: "Ensure Redshift uses SSL"

resource "aws_redshift_parameter_group" "fail" {
  name   = var.param_group_name
  family = "redshift-1.0"
}
