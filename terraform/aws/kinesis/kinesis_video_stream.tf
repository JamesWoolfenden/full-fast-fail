# fails
# CKV_AWS_177: "Ensure Kinesis Video Stream is encrypted by KMS using a customer managed Key (CMK)"

resource "aws_kinesis_video_stream" "fail" {
  name = "terraform-kinesis-video-stream-test"

  data_retention_in_hours = 1
  device_name             = "kinesis-video-device-name"
}
