# fails
# CKV_AWS_98: "Ensure all data stored in the Sagemaker Endpoint is securely encrypted at rest"

resource "aws_sagemaker_endpoint_configuration" "fail" {
  tags = { test = "Fail" }
}
