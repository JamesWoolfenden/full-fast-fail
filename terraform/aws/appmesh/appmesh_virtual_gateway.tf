# fails
# todo tls cert is not specified
# todo ensure access log are enabled
# todo check backend_defaults policy is modern
# todo others
# todo enforce tls

resource "aws_appmesh_virtual_gateway" "example" {
  name      = "example-virtual-gateway"
  mesh_name = "example-service-mesh"

  spec {

    backend_defaults {
      client_policy {
        tls {
          enforce = false
          certificate {
            
          }
        }
      }
    }

    listener {
      port_mapping {
        port     = 8080
        protocol = "http"
      }

      tls {
        certificate {
          acm {
            certificate_arn = aws_acm_certificate.example.arn
          }
        }

        mode = "STRICT"
      }
    }

    # logging {
    #   access_log {
    #     file {
    #       path = "/var/log/access.log"
    #     }
    #   }
    # }
  }


  tags = {
    Environment = "test"
  }
}
