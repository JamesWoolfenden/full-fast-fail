resource "aws_instance" "fail" {
  associate_public_ip_address = true
  user_data                   = <<USERDATA
#Soo common to see
export AWS_ACCESS_KEY_ID     = "AKIAIOSFODNN7EXAMPLE"
export AWS_SECRET_ACCESS_KEY = "MYMOSTSECRETTHING"
USERDATA
  instance_type               = "t3.micro"
  ami                         = "anystring"
}
