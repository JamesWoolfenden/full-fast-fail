# fail
# CKV_AWS_106: "Ensure EBS default encryption is enabled"
resource "aws_ebs_encryption_by_default" "disabled" {
  enabled = false
}
