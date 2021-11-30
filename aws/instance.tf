resource "aws_instance" "fail" {
  ami           = var.ami
  instance_type = "t2.nano"
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
}
