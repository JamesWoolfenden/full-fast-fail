# fails
# todo basic_auth specified
resource "aws_amplify_app" "example" {
  name = "example"

  enable_basic_auth      = true
  basic_auth_credentials = base64encode("username1:password1")
}
