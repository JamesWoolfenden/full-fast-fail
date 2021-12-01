# fail
# CKV_AWS_59: "Ensure there is no open access to back-end resources through API"

resource "aws_api_gateway_method" "fail" {
  rest_api_id   = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id   = aws_api_gateway_resource.MyDemoResource.id
  http_method   = "GET"
  authorization = "NONE"
}
