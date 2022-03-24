resource "kubernetes_cluster_role" "fail_wild" {
  metadata {
    name = "terraform-example"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["*"]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
}
