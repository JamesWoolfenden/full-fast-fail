# fails
# CKV_AWS_3: "Ensure all data stored in the EBS is securely encrypted"
# CKV2_AWS_9: "Ensure that EBS are added in the backup plans of AWS Backup"
# CKV2_AWS_2: "Ensure that only encrypted EBS volumes are attached to EC2 instances"

resource "aws_ebs_volume" "fail" {
  availability_zone = "eu-west-1a"
  size              = 1
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.fail.id
  instance_id = aws_instance.web.id
}
