# fails

# tfsec
# AWS047 SQS policy 'aws_sqs_queue_policy.fail' has a wildcard action specified.
resource "aws_sqs_queue_policy" "fail_policy" {
  queue_url = aws_sqs_queue.fail.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
           "Principal": {
            "AWS": [,
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": "*",
          "Resource": "${aws_sqs_queue_policy.fail_policy.arn}"
       }
    ]
}
POLICY
}
