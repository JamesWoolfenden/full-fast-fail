# fails
# CKV_AWS_7: "Ensure rotation for customer created CMKs is enabled"
# CKV_AWS_33: "Ensure KMS key policy does not contain wildcard (*) principal"

# Resource 'aws_kms_key.fail_0' does not have KMS Key auto-rotation enabled.

resource "aws_kms_key" "fail_0" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    },
  ]
}
POLICY
}
