resource "aws_api_gateway_resource" "fail" {
    rest_api_id = aws_api_gateway_rest_api.fail.id
      parent_id   = aws_api_gateway_rest_api.fail.root_resource_id
  path_part   = "mydemoresource"
}
