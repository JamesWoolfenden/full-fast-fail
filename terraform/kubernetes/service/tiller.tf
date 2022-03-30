resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-example"
    labels {
      app  = "helm"
      name = "tiller"
    }
  }
  spec {
    selector = {
      app = kubernetes_pod.example.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "fail" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector = {
      app  = "helm"
      name = "tiller"
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
