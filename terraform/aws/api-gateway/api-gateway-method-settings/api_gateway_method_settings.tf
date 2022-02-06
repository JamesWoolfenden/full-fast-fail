# fail
# todo if cache is enabled ensure that it is encrypted

# kics

resource "aws_api_gateway_method_settings" "fail" {
  rest_api_id = aws_api_gateway_rest_api.fail.id
  stage_name  = aws_api_gateway_stage.fail.stage_name
  method_path = "path1/GET"

  settings {
    caching_enabled      = true
    metrics_enabled      = true
    logging_level        = "INFO"
    cache_data_encrypted = false
  }
}