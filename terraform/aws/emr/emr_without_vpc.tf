# fails
# todo
resource "aws_emr_cluster" "fail" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"

}
