# fail
# CKV_AWS_163: "Ensure ECR image scanning on push is enabled"
# CKV_AWS_136: "Ensure that ECR repositories are encrypted using KMS"
# CKV_AWS_51: "Ensure ECR Image Tags are immutable"

# tfsec
# AWS093 Resource 'aws_ecr_repository.fail' does not have CMK encryption configured
# AWS023 Resource 'aws_ecr_repository.name' defines a disabled ECR image scan.
# AWS078 Resource 'aws_ecr_repository.name' has `image_tag_mutability` attribute  not set to `IMMUTABLE`
resource "aws_ecr_repository" "name" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"
}
