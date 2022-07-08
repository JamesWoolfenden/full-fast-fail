resource "aws_organizations_organization" "fail" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]

  feature_set = "CONSOLIDATED_BILLING"
}
