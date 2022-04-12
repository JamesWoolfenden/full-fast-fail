#fails
# CKV_ALI_7: "Ensure disk is encrypted"
# CKV_ALI_8: "Ensure Disk is encrypted with Customer Master Key"
resource "alicloud_disk" "fail" {
  # cn-beijing
  zone_id     = "cn-beijing-b"
  disk_name   = "New-disk"
  description = "Hello ecs disk."
  category    = "cloud_efficiency"
  size        = "30"
  tags = {
    Name = "TerraformTest"
  }
}
