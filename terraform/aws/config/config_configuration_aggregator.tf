# fail
# CKV_AWS_121: "Ensure AWS Config is enabled in all regions"

# tfsec
# AWS085 Resource 'aws_config_configuration_aggregator.organization' should have account aggregation sources to all regions

resource "aws_config_configuration_aggregator" "organization" {

  name = "example"

  account_aggregation_source {
    account_ids = ["123456789012"]
    regions     = ["us-east-2", "us-east-1", "us-west-1", "us-west-2"]
  }
  tags = { test = "fail" }
}
