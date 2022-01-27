# fails
# CKV_AWS_187: "Ensure Sagemaker domain is encrypted by KMS using a customer managed Key (CMK)"
#  CKV_AWS_98: "Ensure all data stored in the Sagemaker Endpoint is securely encrypted at rest"
#  CKV_AWS_22: "Ensure SageMaker Notebook is encrypted at rest using KMS CMK"
resource "aws_sagemaker_domain" "fail" {
  domain_name = "examplea"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.test.id
  subnet_ids  = [aws_subnet.test.id]

  default_user_settings {
    execution_role = aws_iam_role.test.arn
  }

  retention_policy {
    home_efs_file_system = "Delete"
  }
}
