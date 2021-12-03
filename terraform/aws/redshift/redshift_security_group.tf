# fail
# CKV_AWS_23: "Ensure every security groups rule has a description"

# tfsec
# AWS003 Resource 'aws_redshift_security_group.fail' uses EC2 Classic. Use a VPC instead.
# Resource 'aws_redshift_security_group.fail' should include a description for auditing purposes.

resource "aws_redshift_security_group" "fail" {
  name = "http"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}
