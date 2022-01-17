# fail
# CKV2_AWS_31: "Ensure WAF2 has a Logging Configuration"
# CKV_AWS_175: "Ensure WAF has associated rules"
# CKV_AWS_192: "Ensure WAF prevents message lookup in Log4j2. See CVE-2021-44228 aka log4jshell"
resource "aws_wafv2_web_acl" "no_rule" {
  name        = "managed-rule-example-fail"
  description = "Example of a managed rule."
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "friendly-metric-name"
    sampled_requests_enabled   = false
  }
}
