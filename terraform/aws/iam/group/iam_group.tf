# fail
# CKV2_AWS_21: "Ensure that all IAM users are members of at least one IAM group."
# CKV2_AWS_14: "Ensure that IAM groups includes at least one IAM user"
resource "aws_iam_group_membership" "bad_group" {
  name = "tf-testing-group-membership"


  group = aws_iam_group.bad_group.name
}


resource "aws_iam_group" "bad_group" {
  name = "test-group"
}
