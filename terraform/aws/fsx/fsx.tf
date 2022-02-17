# fails
# CKV_AWS_178: "Ensure fx ontap file system is encrypted by KMS using a customer managed Key (CMK)"


resource "aws_fsx_ontap_file_system" "fail" {
  storage_capacity    = 1024
  subnet_ids          = [aws_subnet.test1.id, aws_subnet.test2.id]
  deployment_type     = "MULTI_AZ_1"
  throughput_capacity = 512
  preferred_subnet_id = aws_subnet.test1.id
  tags                = { test = "fail" }
}
