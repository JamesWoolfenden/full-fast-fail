# fail
# CKV_AWS_108: "Ensure IAM policies does not allow data exfiltration"
# CKV_AWS_111: "Ensure IAM policies does not allow write access without constraints"
# CKV_AWS_49: "Ensure no IAM policies documents allow "*" as a statement's actions"
# CKV_AWS_107: "Ensure IAM policies does not allow credentials exposure"
# CKV_AWS_109: "Ensure IAM policies does not allow permissions management / resource exposure without constraints"
# CKV_AWS_1: "Ensure IAM policies that allow full "*-*" administrative privileges are not created"
# CKV_AWS_110: "Ensure IAM policies does not allow privilege escalation"

data "aws_iam_policy_document" "fail" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "*"
    ]
    resources = [
      "*",
    ]
  }
}
