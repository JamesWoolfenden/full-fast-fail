# fails

#no addon
resource "alicloud_cs_kubernetes" "fail" {
  worker_number         = 4
  worker_vswitch_ids    = ["vsw-id1", "vsw-id1", "vsw-id3"]
  master_vswitch_ids    = ["vsw-id1", "vsw-id1", "vsw-id3"]
  master_instance_types = ["ecs.n4.small", "ecs.sn1ne.xlarge", "ecs.n4.xlarge"]
  worker_instance_types = ["ecs.n4.small", "ecs.sn1ne.xlarge", "ecs.n4.xlarge"]

  pod_vswitch_ids = ["id1"]

  # addons {
  #   config = ""
  #   name   = "terway-eniip"
  # }

}
