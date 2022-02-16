# fails
# CKV_AWS_120: "Ensure API Gateway caching is enabled"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV2_AWS_4: "Ensure API Gateway stage have logging level defined as appropriate"
# CKV2_AWS_29: "Ensure public API gateway are protected by WAF"
resource "aws_api_gateway_rest_api" "no_assoc" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    "key" = "value"
  }
}

resource "aws_api_gateway_stage" "no_assoc" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_assoc.id
  stage_name    = "example"
}

variable "name" {
  type        = string
  description = "testcode"
  default     = "gateway"
}

resource "aws_api_gateway_deployment" "example" {
  rest_api_id = aws_api_gateway_rest_api.no_assoc.id
}
