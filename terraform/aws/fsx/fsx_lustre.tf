# fails
# CKV_AWS_190: "Ensure lustre file systems is encrypted by KMS using a customer managed Key (CMK)"

resource "aws_fsx_lustre_file_system" "fail" {
  storage_capacity            = 1200
  subnet_ids                  = [aws_subnet.test1.id]
  deployment_type             = "PERSISTENT_1"
  per_unit_storage_throughput = 50
  tags                        = { test = "fail" }
}
