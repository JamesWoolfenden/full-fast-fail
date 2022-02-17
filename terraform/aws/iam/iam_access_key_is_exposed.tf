resource "aws_iam_access_key" "positive1" {
  user   = "some-user"
  status = "Active"
  tags   = { test = "Fail" }
}

resource "aws_iam_access_key" "positive2" {
  user = "some-user"
  tags = { test = "Fail" }
}
