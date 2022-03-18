resource "kubernetes_pod" "test_os" {
  metadata {
    name = "terraform-example1"
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"

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

    volume {
      host_path {
        path = "/var/log"
      }
    }

    dns_policy = "None"
  }
}

resource "kubernetes_persistent_volume" "test2" {
  metadata {
    name = "terraform-example2"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    capacity = {
      storage = "1Gi"
    }
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = azurerm_managed_disk.example.id
        disk_name     = "example"
        kind          = "Managed"
      }
    }
  }
}


resource "azurerm_managed_disk" "example" {
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  name                 = "brian"
  location             = azurerm_resource_group.name.location
  resource_group_name  = azurerm_resource_group.name.name
}


resource "azurerm_resource_group" "name" {
  location = "uksouth"
  name     = "brian"
}
