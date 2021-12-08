# fails
# CKV_AWS_168: "Ensure SQS queue policy is not public by only allowing specific services or principals to access it"
# CKV_AWS_27: "Ensure all data stored in the SQS queue is encrypted"
#todo false positive CKV_AWS_72: "Ensure SQS policy does not allow ALL (*) actions."

# tfsec

# AWS015 Resource 'aws_sqs_queue.fail' defines an unencrypted SQS queue.
resource "aws_sqs_queue" "fail" {
  #   kms_master_key_id  =aws_kms_key.pass.arn
  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "*"
    }
  ]
}
POLICY
}
