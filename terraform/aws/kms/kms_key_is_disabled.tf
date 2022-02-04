# fail
# todo
resource "aws_kms_key" "fail" {
  description             = "KMS key 1"
  is_enabled = false
}
