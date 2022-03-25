
# fails
# CPU Limits should be setCheckov CKV_K8S_11
# CPU requests should be setCheckov CKV_K8S_10
# Memory Limits should be setCheckov CKV_K8S_12
# Memory requests should be setCheckov CKV_K8S_13
# Readiness Probe Should be ConfiguredCheckov CKV_K8S_9
resource "kubernetes_pod" "fail_undefined" {
  metadata {
    name = "terraform-example"
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example22"

      env {
        name  = "environment"
        value = "test"
      }

      port {
        container_port = 8080
      }

      liveness_probe {
        http_get {
          path = "/nginx_status"
          port = 80

          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }

        initial_delay_seconds = 3
        period_seconds        = 3
      }
    }

    container {
      image = "nginx:1.7.9"
      name  = "example22222"

      resources {
        requests = {
          cpu    = "250m"
          memory = "50Mi"
        }
      }

      env {
        name  = "environment"
        value = "test"
      }

      port {
        container_port = 8080
      }

      liveness_probe {
        http_get {
          path = "/nginx_status"
          port = 80

          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }

        initial_delay_seconds = 3
        period_seconds        = 3
      }
    }



    dns_config {
      nameservers = ["1.1.1.1", "8.8.8.8", "9.9.9.9"]
      searches    = ["example.com"]

      option {
        name  = "ndots"
        value = 1
      }

      option {
        name = "use-vc"
      }
    }

    dns_policy = "None"
  }
}
