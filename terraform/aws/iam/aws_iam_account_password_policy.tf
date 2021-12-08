# fails
# CKV_AWS_11: "Ensure IAM password policy requires at least one lowercase letter"
# CKV_AWS_15: "Ensure IAM password policy requires at least one uppercase letter"
# CKV_AWS_9: "Ensure IAM password policy expires passwords within 90 days or less"
# CKV_AWS_13: "Ensure IAM password policy prevents password reuse"
# CKV_AWS_12: "Ensure IAM password policy requires at least one number"
# CKV_AWS_10: "Ensure IAM password policy requires minimum length of 14 or greater"
# CKV_AWS_14: "Ensure IAM password policy requires at least one symbol"


resource "aws_iam_account_password_policy" "fail" {
}
