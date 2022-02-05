#fails
# CKV_AWS_122: "Ensure that direct internet access is disabled for an Amazon SageMaker Notebook Instance"
# CKV_AWS_22: Ensure SageMaker Notebook is encrypted at rest using KMS CMK
# todo in a vpc? subnet_id is not set
resource "aws_sagemaker_notebook_instance" "name" {
  direct_internet_access = "enabled"
}
