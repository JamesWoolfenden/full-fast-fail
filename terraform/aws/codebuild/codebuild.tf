# fail
# CKV_AWS_78: "Ensure that CodeBuild Project encryption is not disabled"
# CKV_AWS_147: "Ensure that CodeBuild projects are encrypted"

# tfsec
# CodeBuild project 'aws_codebuild_project.default' does not encrypt produced artifacts

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

  secondary_artifacts {
    encryption_disabled = false
  }
  tags = { test = "fail" }
}
