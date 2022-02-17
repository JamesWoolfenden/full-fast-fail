# fails
# kics
# todo check mfa_configuration is set to 'ON' or 'OPTIONAL" - maybe irrelevant
# todo check has 'sms_configuration' or 'software_token_mfa_configuration' defined - maybe irrelevant

resource "aws_cognito_user_pool" "fail" {
  # ... other configuration ...

  sms_authentication_message = "Your code is {####}"

  sms_configuration {
    external_id    = "example"
    sns_caller_arn = aws_iam_role.example.arn
  }

  software_token_mfa_configuration {
    enabled = true
  }
  tags = { test = "fail" }
}
