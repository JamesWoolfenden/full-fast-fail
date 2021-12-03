# fails

# CKV_GIT_2: "Ensure Repository Webhook uses secure Ssl"

resource "github_repository_webhook" "foo" {
  repository = github_repository.repo.name
  name       = "web"
  configuration {
    insecure_ssl = true
  }
}
