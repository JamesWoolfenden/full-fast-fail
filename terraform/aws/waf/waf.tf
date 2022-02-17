#fail
#CKV_AWS_175: "Ensure WAF has associated rules"
#CKV_AWS_176: "Ensure Logging is enabled for WAF  Web Access Control Lists"

resource "aws_wafregional_web_acl" "fail" {
  name        = "tfWebACLregionalfail"
  metric_name = "tfWebACLregionalfail"

  default_action {
    type = "ALLOW"
  }
  tags = { test = "fail" }
}


resource "aws_waf_web_acl" "fail" {
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }
  tags = { test = "fail" }
}
