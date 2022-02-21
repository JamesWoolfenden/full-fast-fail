# fail
# CKV_AWS_225 cache_data_encrypted
# metrics enabled
# logging level is not off
# data trace?

# kics
# API Gateway Method Settings Cache Not Encrypted aws_api_gateway_method_settings.settings.cache_data_encrypted is set to true
resource "aws_api_gateway_method_settings" "fail" {
  rest_api_id = aws_api_gateway_rest_api.fail.id
  stage_name  = aws_api_gateway_stage.fail.stage_name
  method_path = "path1/GET"

  settings {
    caching_enabled      = true
    metrics_enabled      = false
    logging_level        = "INFO"
    cache_data_encrypted = false
    data_trace_enabled   = false
  }
}
