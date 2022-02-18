# fails
# todo at_rest_encryption_enabled
# todo transit_encryption_enabled
resource "aws_appsync_api_cache" "example" {
  api_id  = aws_appsync_graphql_api.example.id
  expires = "2018-05-03T04:00:00Z"
}
