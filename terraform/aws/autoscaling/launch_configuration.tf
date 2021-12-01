# fail
#CKV_AWS_8: "Ensure all data stored in the Launch configuration EBS is securely encrypted"

# tfsec
# Resource 'aws_launch_configuration.fail' uses an unencrypted root EBS block device.
# Resource 'aws_launch_configuration.fail' has a public IP address associated.

resource "aws_launch_configuration" "fail" {
  root_block_device {
    encrypted = false
  }
  associate_public_ip_address = true
}
