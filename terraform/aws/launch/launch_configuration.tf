# fails
# CKV_AWS_8: "Ensure all data stored in the Launch configuration EBS is securely encrypted"

# tfsec
# Block 'aws_launch_configuration.as_conf' includes potentially sensitive data. Password literal text
# Resource 'aws_launch_configuration.as_conf' has user_data with sensitive data.
# AWS014 Resource 'aws_launch_configuration.as_conf' uses an unencrypted root EBS block device. Consider adding <blue>root_block_device{ encrypted = true }</blue>

resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = <<EOF
export DATABASE_PASSWORD=\"SomeSortOfPassword\"
EOF
}
