# fails
# CKV_GIT_1: "Ensure Repository is Private"
# CKV_GIT_3: vulnerability_alerts set to true

# tfsec
# Resource 'github_repository.fail' does not have vulnerability_alerts set to true
# Resource 'github_repository.fail' has visibility set to public - visibility should be set to `private` or `internal` to make repository private

resource "github_repository" "fail" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

  template {
    owner      = "github"
    repository = "terraform-module-template"
  }
  vulnerability_alerts = false

}
