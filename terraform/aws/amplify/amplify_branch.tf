# fails
# todo basic_auth?

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.example.id
  branch_name = "master"

  # Enable SNS notifications.
  enable_notification = true

  basic_auth_credentials = base64encode("username1:password1")
  enable_basic_auth      = true
}
#     username = "username"
#     password = "password"
#   }
# }
