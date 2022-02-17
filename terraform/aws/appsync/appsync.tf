# fail
# CKV_AWS_194: "Ensure AppSync has Field-Level logs enabled"
# CKV_AWS_193: "Ensure AppSync has Logging enabled"
# CKV2_AWS_33: "Ensure AppSync is protected by WAF"
resource "aws_appsync_graphql_api" "default" {
  authentication_type = "API_KEY"
  name                = "example"
  tags = {
    "key" = "value"
  }
}
