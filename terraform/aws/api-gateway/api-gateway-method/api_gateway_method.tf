# fail
# CKV_AWS_59: "Ensure there is no open access to back-end resources through API"

resource "aws_api_gateway_method" "fail" {
  rest_api_id   = aws_api_gateway_rest_api.fail.id
  resource_id   = aws_api_gateway_resource.fail.id
  http_method   = "GET"
  authorization = "NONE"
  tags          = { test = "Fail" }
}
