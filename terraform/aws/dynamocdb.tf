resource "aws_dynamodb_table" "default" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }
}
