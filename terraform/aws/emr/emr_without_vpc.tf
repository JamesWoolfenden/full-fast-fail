# fails
# todo is either subnet_id or subnets_ids set
resource "aws_emr_cluster" "fail" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"

  tags = { test = "fail" }
}
