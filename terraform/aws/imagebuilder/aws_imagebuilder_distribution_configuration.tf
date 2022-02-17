# fails
# CKV_AWS_199: "Ensure Image Builder Distribution Configuration encrypts AMI's using KMS - a customer managed Key (CMK)"
resource "aws_imagebuilder_distribution_configuration" "example" {
  name        = "example"
  description = "non empty value"

  distribution {
    ami_distribution_configuration {
      //kms_key_id = ""
      ami_tags = {
        CostCenter = "IT"
      }

      name = "example-{{ imagebuilder:buildDate }}"

      launch_permission {
        user_ids = ["123456789012"]
      }
    }

    region = "us-east-1"
  }
  tags = { test = "Fail" }
}
