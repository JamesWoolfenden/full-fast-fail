# fails
# The default namespace should not be usedCheckov CKV_K8S_21
resource "kubernetes_service_account" "example" {
  metadata {
    name = "default"
    labels = {
      "app" = "tiller"
    }
  }
}
