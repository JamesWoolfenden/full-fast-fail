# fail
# CKV2_AWS_18: "Ensure that Elastic File System (Amazon EFS) file systems are added in the backup plans of AWS Backup"
# CKV_AWS_42: "Ensure EFS is securely encrypted"
# CKV_AWS_184: "Ensure resource is encrypted by KMS using a customer managed Key (CMK)"
# tfsec
# aws-efs-enable-at-rest-encryption


resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 12 * * ? *)"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
}


resource "aws_backup_selection" "not_ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name = "MyProduct"
  }
}

resource "aws_efs_file_system" "not_ok_efs" {
  creation_token = "my-product"

  tags = {
    Name = "MyProduct"
  }
}
