# fails
# CKV_SECRET_6: "Base64 High Entropy String"
# CKV_GIT_4: "Ensure Secrets are encrypted"

resource "github_actions_environment_secret" "fail" {
  environment     = "example_environment"
  secret_name     = "example_secret_name"
  plaintext_value = "INTHECLEAR"
}

resource "github_actions_organization_secret" "fail" {
  environment     = "example_environment"
  secret_name     = "example_secret_name"
  plaintext_value = "INTHECLEAR"
}

resource "github_actions_secret" "fail" {
  environment     = "example_environment"
  secret_name     = "example_secret_name"
  plaintext_value = "INTHECLEAR"
}
