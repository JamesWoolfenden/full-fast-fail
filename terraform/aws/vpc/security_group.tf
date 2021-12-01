# fail
#  i dont think this is a great rule
#

resource "aws_security_group" "bad_example" {
	ingress {
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		cidr_blocks = ["0.0.0.0/0"]
	}
}
