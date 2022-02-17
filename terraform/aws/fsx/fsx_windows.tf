# fails
# CKV_AWS_179: "Ensure FSX Windows filesystem is encrypted by KMS using a customer managed Key (CMK)"

resource "aws_fsx_windows_file_system" "fail" {
  active_directory_id = aws_directory_service_directory.test.id
  skip_final_backup   = true
  storage_capacity    = 32
  subnet_ids          = [aws_subnet.test1.id]
  throughput_capacity = 8
  tags                = { test = "fail" }
}
