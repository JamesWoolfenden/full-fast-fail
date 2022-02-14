# fails
# todo Service account should not have improper privileges like admin, editor, owner, or write roles
# -Service Account with Improper Privileges
resource "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "serviceAccount:jane@example.com",
    ]
  }
}
