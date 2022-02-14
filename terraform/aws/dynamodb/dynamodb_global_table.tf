resource "aws_dynamodb_global_table" "myTable" {

  depends_on = [
    aws_dynamodb_table.us_east-1,
    aws_dynamodb_table.us_west-2,
  ]
  provider = aws.us-east-1

  name = "myTable"

  replica {
    region_name = "us-east-1"
  }

  replica {
    region_name = "us-west-2"
  }
}
