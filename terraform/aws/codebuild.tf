resource "aws_codebuild_project" "default" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  artifacts {
    type                = "S3"
    encryption_disabled = true
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }

}
