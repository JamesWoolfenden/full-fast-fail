# fail
# CKV2_AWS_5: "Ensure that Security Groups are attached to another resource"
# CKV_AWS_23: "Ensure every security groups rule has a description"
# CKV_AWS_25: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389"
# CKV_AWS_24: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22"

# tfsec
# Mixed usage between 'aws_security_group_rule.fail' and 'aws_security_group.fail_sg'
# AWS018 Resource 'aws_security_group.bad_example' should include a description for auditing purposes.
# AWS008 Resource 'aws_security_group.bad_example' defines a fully open ingress security group.
# AWS009 Resource 'aws_security_group.bad_example' defines a fully open egress security group.



resource "aws_security_group" "bad_example" {
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 3389
    to_port     = 3389
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { test = "fail" }
}

resource "aws_security_group_rule" "fail" {
  security_group_id = aws_security_group.bad_example.id
  type              = "ingress"
  cidr_blocks       = ["172.31.0.0/16"]
  tags              = { test = "fail" }
}
