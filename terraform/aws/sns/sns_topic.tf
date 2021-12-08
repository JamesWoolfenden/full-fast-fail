# fails
# CKV_AWS_26: "Ensure all data stored in the SNS topic is encrypted"

# tfsec
# AWS016 Resource 'aws_sns_topic.fail' defines an unencrypted SNS topic.

resource "aws_sns_topic" "fail" {
}
