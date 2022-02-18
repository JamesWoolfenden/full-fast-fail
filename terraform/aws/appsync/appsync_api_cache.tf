# fails
# done at_rest_encryption_enabled
# done transit_encryption_enabled
resource "aws_appsync_api_cache" "example" {
  api_id                     = aws_appsync_graphql_api.default.id
  transit_encryption_enabled = false
  at_rest_encryption_enabled = false
  ttl                        = 60
  type                       = "SMALL"
  api_caching_behavior       = "FULL_REQUEST_CACHING"
}
