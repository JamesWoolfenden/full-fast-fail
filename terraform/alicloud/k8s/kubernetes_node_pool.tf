# Fails
# CKV_ALI_31: "Ensure K8s nodepools are set to auto repair"
# todo auto_update

resource "alicloud_cs_kubernetes_node_pool" "fail" {
  name           = var.name
  cluster_id     = alicloud_cs_managed_kubernetes.default.0.id
  vswitch_ids    = [alicloud_vswitch.default.id]
  instance_types = [data.alicloud_instance_types.default.instance_types.0.id]

  system_disk_category = "cloud_efficiency"
  system_disk_size     = 40
  key_name             = alicloud_key_pair.default.key_name

  # comment out node_count and specify a new field desired_size
  # node_count = 1

  desired_size = 1

  management {
    auto_repair     = false #default
    auto_upgrade    = false #default
    surge           = 1
    max_unavailable = 1
  }
}
