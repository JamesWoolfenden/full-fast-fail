// todo log rotation gt than 90?
// todo log store isnot encrypted

resource "alicloud_log_project" "example4" {
  name        = "tf-log"
  description = "created by terraform"
}

resource "alicloud_log_store" "fail" {
  project               = alicloud_log_project.example.name
  name                  = "tf-log-store"
  retention_period      = 60
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
  # encrypt_conf {
  #   enable              = true
  #   encrypt_type        = "default"
  #   user_cmk_info {
  #     cmk_key_id        = "your_cmk_key_id"
  #     arn               = "your_role_arn"
  #     region_id         = "you_cmk_region_id"
  #   }
  # }
}
