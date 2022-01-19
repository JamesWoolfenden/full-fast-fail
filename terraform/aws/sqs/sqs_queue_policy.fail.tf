# fail

# CKV_AWS_72: "Ensure SQS policy does not allow ALL (*) actions."
# CKV_AWS_168: "Ensure SQS queue policy is not public by only allowing specific services or principals to access it"
resource "aws_sqs_queue_policy" "fail" {
  queue_url = aws_sqs_queue.fail.id

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
