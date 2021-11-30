resource "aws_sns_topic_policy" "sns_tp2" {
  arn = aws_sns_topic.test.arn

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
           "Principal": {
            "AWS": [
                "arn:aws:iam::123456789101:role/sns",
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": [
            "SNS:Subscribe",
            "SNS:SetTopicAttributes",
            "SNS:RemovePermission",
            "SNS:Receive",
            "SNS:Publish",
            "SNS:ListSubscriptionsByTopic",
            "SNS:GetTopicAttributes",
            "SNS:DeleteTopic",
            "SNS:AddPermission",
          ],
          "Resource": "${aws_sns_topic.test.arn}"
       }
    ]
}
POLICY
}
