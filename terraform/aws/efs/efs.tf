# fail
# CKV_AWS_42: "Ensure EFS is securely encrypted"
# CKV2_AWS_18: "Ensure that Elastic File System (Amazon EFS) file systems are added in the backup plans of AWS Backup"
# CKV_AWS_184: "Ensure resource is encrypted by KMS using a customer managed Key (CMK)"

# tfsec
# AWS048 Resource 'aws_efs_file_system.sharedstore' actively does not have encryption applied.
resource "aws_efs_file_system" "sharedstore" {

  creation_token = var.efs["creation_token"]

  lifecycle_policy {
    transition_to_ia = var.efs["transition_to_ia"]
  }

  kms_key_id                      = ""
  encrypted                       = false
  performance_mode                = var.efs["performance_mode"]
  provisioned_throughput_in_mibps = var.efs["provisioned_throughput_in_mibps"]
  throughput_mode                 = var.efs["throughput_mode"]
  tags                            = { test = "Fail" }
}
