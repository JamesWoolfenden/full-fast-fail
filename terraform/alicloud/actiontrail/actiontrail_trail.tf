# fails
# CKV_ALI_4: "Ensure Action Trail Logging for all regions"
# CKV_ALI_5: "Ensure Action Trail Logging for all events"
resource "alicloud_actiontrail_trail" "fail" {
  trail_name         = "action-trail"
  oss_write_role_arn = "acs:ram::1182725xxxxxxxxxxx"
  oss_bucket_name    = "bucket_name"
  event_rw           = "Read"
  trail_region       = "cn-hangzhou"
}
