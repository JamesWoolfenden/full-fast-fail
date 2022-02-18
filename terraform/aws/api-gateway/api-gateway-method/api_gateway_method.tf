# fails
# Ensure there is no open access to back-end resources through APICheckov CKV_AWS_59

# kics
# API Gateway With Open Access, Severity: MEDIUM, Results: 1
# Description: API Gateway Method should restrict the authorization type, except for the HTTP OPTIONS method.

resource "aws_api_gateway_method" "fail_open" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id = aws_api_gateway_resource.MyDemoResource.id
  http_method = "GET"
  # http_method   = "OPTIONS"
  authorization = "NONE"
  tags          = { test = "Fail" }
}
