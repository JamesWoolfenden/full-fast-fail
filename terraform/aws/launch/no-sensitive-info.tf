resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = <<EOF
export DATABASE_PASSWORD=\"SomeSortOfPassword\"
EOF
}
