resource "alicloud_alb_acl" "fail" {
  acl_name = "anyoldguff"
}

resource "alicloud_alb_acl_entry_attachment" "thehorror" {
  acl_id      = alicloud_alb_acl.fail.id
  entry       = "0.0.0.0/0"
  description = var.name
}
