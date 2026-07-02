# fail
# Billing account IAM must not grant billing.admin or billing.creator roles (HLD_PROPOSED_015)
resource "google_billing_account_iam_binding" "fail" {
  billing_account_id = "000000-000000-000000"
  role               = "roles/billing.admin"
  members            = ["user:jane@example.com"]
}

# fail
# Billing account IAM must not grant billing.admin or billing.creator roles (HLD_PROPOSED_015)
resource "google_billing_account_iam_member" "fail" {
  billing_account_id = "000000-000000-000000"
  role               = "roles/billing.creator"
  member             = "user:jane@example.com"
}
