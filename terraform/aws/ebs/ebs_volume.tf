# fails
# CKV_AWS_3: "Ensure all data stored in the EBS is securely encrypted"
# CKV2_AWS_9: "Ensure that EBS are added in the backup plans of AWS Backup"
# CKV2_AWS_2: "Ensure that only encrypted EBS volumes are attached to EC2 instances"
# CKV_AWS_189: "Ensure EBS Volume is encrypted by KMS using a customer managed Key (CMK)"


# tfsec
# Resource 'aws_ebs_volume.fail' does not use CMK
# Resource 'aws_ebs_volume.fail' uses default value for encrypted

resource "aws_ebs_volume" "fail" {
  availability_zone = "eu-west-1a"
  size              = 1
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.fail.id
  instance_id = aws_instance.web.id
}
