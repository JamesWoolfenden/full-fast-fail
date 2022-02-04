# fails
# todo the check is to ensure that the type is private
resource "aws_api_gateway_rest_api" "positive1" {
  name = "regional-example"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  #   endpoint_configuration {
  #   types = ["PRIVATE"]
  # }
}
