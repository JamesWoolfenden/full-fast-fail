# fails

resource "aws_organizations_policy" "positive1" {
  name = "example"

  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": [
      {
        "Effect": "Allow",
        "Action": "iam",
        "Resource": "*"
        }
    ]
}
CONTENT
  tags    = { test = "Fail" }
}
