#fails

resource "alicloud_disk" "fail" {
  # cn-beijing
  availability_zone = "cn-beijing-b"
  name              = "New-disk"
  description       = "Hello ecs disk."
  category          = "cloud_efficiency"
  size              = "30"
  tags = {
    Name = "TerraformTest"
  }
}
