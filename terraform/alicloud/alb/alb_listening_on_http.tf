
//todo protocol is not HTTP

resource "alicloud_alb_listener" "fail" {
  load_balancer_id     = alicloud_alb_load_balancer.fail.id
  listener_protocol    = "HTTP"
  listener_port        = 443
  listener_description = "createdByTerraform"
  default_actions {
    type = "ForwardGroup"
    forward_group_config {
      server_group_tuples {
        server_group_id = alicloud_alb_server_group.fail.id
      }
    }
  }
  certificates {
    certificate_id = join("", [alicloud_ssl_certificates_service_certificate.fail.id, "-cn-hangzhou"])
  }
  acl_config {
    acl_type = "White"
    acl_relations {
      acl_id = alicloud_alb_acl.example.id
    }
  }
}

resource "alicloud_alb_load_balancer" "fail" {

}

resource "alicloud_alb_server_group" "fail" {

}

resource "alicloud_ssl_certificates_service_certificate" "fail" {

}
