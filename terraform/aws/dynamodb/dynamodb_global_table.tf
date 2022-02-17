resource "aws_dynamodb_global_table" "my_table" {

  depends_on = [
    aws_dynamodb_table.us_east_1,
    aws_dynamodb_table.us_west_2,
  ]
  provider = aws.us_east_1

  name = "myTable"

  replica {
    region_name = "us-east-1"
  }

  replica {
    region_name = "us-west-2"
  }
  tags = { test = "Fail" }
}
