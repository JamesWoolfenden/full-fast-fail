# fails
# todo is encrypted
# has kms_key_id set
resource "aws_ebs_snapshot_import" "example" {

  disk_container {
    format = "VHD"
    user_bucket {
      s3_bucket = "disk-images"
      s3_key    = "source.vhd"
    }
  }
  # encrypted = true
  # kms_key_id = aws_kms_key.example.arn
  role_name = "disk-image-import"

  tags = {
    Name = "HelloWorld"
  }
}
