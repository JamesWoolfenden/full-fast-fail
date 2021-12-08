#fails
# CKV_AWS_122: "Ensure that direct internet access is disabled for an Amazon SageMaker Notebook Instance"


resource "aws_sagemaker_notebook_instance" "name" {
  direct_internet_access="enabled"
}
