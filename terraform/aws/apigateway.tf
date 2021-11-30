resource "aws_api_gateway_stage" "fail" {
  name = "example"
}

resource "aws_api_gateway_rest_api" "fail" {
  name = "example"
}
