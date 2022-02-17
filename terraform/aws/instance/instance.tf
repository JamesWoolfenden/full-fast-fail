# fails
# CKV_AWS_8: "Ensure all data stored in the Launch configuration EBS is securely encrypted"
# CKV_AWS_46: "Ensure no hard-coded secrets exist in EC2 user data"
# CKV_AWS_79: "Ensure Instance Metadata Service Version 1 is not enabled"
# CKV_AWS_88: "EC2 instance should not have public IP."
# CKV_AWS_126: "Ensure that detailed monitoring is enabled for EC2 instances"
# CKV_AWS_135: "Ensure that EC2 is EBS optimized"

# tfsec
# AWS062 Resource 'aws_instance.fail' has userdata with access secret key defined.
# AWS012 Resource 'aws_instance.fail' has a public IP address associated.
# AWS079 Resource 'aws_instance.fail' is missing `metadata_options` block - it is required with `http_tokens` set to `required` to make Instance Metadata Service more secure.

resource "aws_instance" "fail" {
  ami                         = var.ami
  instance_type               = "t2.nano"
  associate_public_ip_address = true
  vpc_security_group_ids = [
  aws_security_group.web-node.id]
  subnet_id = aws_subnet.web_subnet.id
  user_data = <<EOF
		 #! /bin/bash
		 sudo apt-get update
		 sudo apt-get install -y apache2
		 sudo systemctl start apache2
		 sudo systemctl enable apache2
		 export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMAAA
		 export AWS_SECRET_ACCESS_KEY=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
		 export AWS_DEFAULT_REGION=us-west-2
		 echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
		 EOF
  tags = {
    "key" = "value"
  }
}
