resource "aws_sqs_queue_policy" "fail" {
  queue_url = aws_sqs_queue.q.id

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
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}
