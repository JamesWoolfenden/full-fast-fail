resource "aws_security_group" "fail_openport" {
  name        = "http_positive_tcp_1"
  description = "Gets the HTTP port open with the tcp protocol"

  ingress {
    description = "HTTP port open"
    from_port   = 78
    to_port     = 91
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { test = "fail" }
}
