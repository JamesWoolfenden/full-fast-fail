# fails
# Ensure resource is encrypted by KMS using a customer managed Key (CMK)Checkov (CKV_AWS_203)

resource "aws_fsx_openzfs_file_system" "test" {
  storage_capacity    = 64
  subnet_ids          = [aws_subnet.test1.id]
  deployment_type     = "SINGLE_AZ_1"
  throughput_capacity = 64
}
