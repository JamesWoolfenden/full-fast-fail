# fails
# CPU Limits should be setCheckov CKV_K8S_11
# CPU requests should be setCheckov CKV_K8S_10
# Image Tag should be fixed - not latest or blankCheckov CKV_K8S_14
# Liveness Probe Should be ConfiguredCheckov CKV_K8S_8
# Memory Limits should be setCheckov CKV_K8S_12
# Memory requests should be setCheckov CKV_K8S_13
# Do not admit privileged containersCheckov CKV_K8S_16
# Readiness Probe Should be ConfiguredCheckov CKV_K8S_9
# Do not admit containers wishing to share the host IPC namespaceCheckov CKV_K8S_18
# Do not admit containers wishing to share the host process ID namespaceCheckov CKV_K8S_17
resource "kubernetes_pod" "fail_ipc" {
  metadata {
    name = "terraform-example"
  }

  spec {
    host_ipc = true
    host_pid = true

    container {
      image = "tiller-image"
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
      image             = "nginx"
      image_pull_policy = "Never"
      name              = "example"

      security_context {
        privileged                 = true
        allow_privilege_escalation = true
        capabilities {
          add  = ["NET_RAW"]
          drop = ["NET_BIND_SERVICE"]
        }
      }
      env {
        name  = "environment"
        value = "test"
      }

      port {
        container_port = 8080
        host_port      = 8080
      }

      # resources = {
      #   requests = {
      #     memory = "50Mi"
      #   }
      #   limits ={
      #     memory = "50Mi"
      #   }
      # }
      # liveness_probe {
      #   http_get {
      #     path = "/nginx_status"
      #     port = 80

      #     http_header {
      #       name  = "X-Custom-Header"
      #       value = "Awesome"
      #     }
      #   }

      #   initial_delay_seconds = 3
      #   period_seconds        = 3
      # }
    }
    # readiness_probe {
    #     failure_threshold = 3
    #     http_get {
    #       path = "/health"
    #       port = "10254"
    #       scheme = "http"
    #     }
    #     period_seconds = 10
    #     success_threshold = 1
    #     timeout_seconds = 10
    #   }
    # }
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
