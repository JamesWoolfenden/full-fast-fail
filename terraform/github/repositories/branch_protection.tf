#  fails
#  todo
#  tfsec
#  Resource 'github_branch_protection.fail' does not have require_signed_commits set to true

resource "github_branch_protection" "fail" {
  repository_id = github_repository.example.node_id

  pattern                = "main"
  enforce_admins         = true
  allows_deletions       = true
  require_signed_commits = false
}
