#fails

resource "aws_athena_database" "fail" {
  name = "wg-non-encrypted"
}
