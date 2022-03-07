# fail
# todo deployment has access logs (from stage settings)
# todo use aws_api_gateway_stage resource rather than attribute stage_name
# CKV_AWS_217 set create_before_destroy to avoid outages
resource "aws_api_gateway_deployment" "fail" {
  rest_api_id = "some rest api id"
  stage_name  = "some name"
  # lifecycle {
  #   create_before_destroy=true
  # }
  tags {
    project = "ProjectName"
  }
}

resource "aws_api_gateway_stage" "fail" {
  deployment_id = aws_api_gateway_deployment.fail.id
  rest_api_id   = aws_api_gateway_rest_api.example.id
  stage_name    = "example"
  # access_log_settings {
  #   destination_arn = "dest"
  #   format = "format"
  # }
  tags = { test = "Fail" }
}
