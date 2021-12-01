resource "aws_instance" "fail" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
}
