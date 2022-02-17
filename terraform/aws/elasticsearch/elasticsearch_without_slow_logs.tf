# fails
# todo log_publishing_options.log_type is not INDEX_SLOW_LOGS or SEARCH_SLOW_LOGS
resource "aws_elasticsearch_domain" "positive1" {
  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.example.arn
    log_type                 = "ES_APPLICATION_LOGS"
    enabled                  = true
  }
  # log_publishing_options {
  #   log_type=
  # }
  tags = { test = "fail" }
}
