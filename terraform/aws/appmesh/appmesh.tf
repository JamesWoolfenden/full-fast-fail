resource "aws_appmesh_mesh" "simple" {
  name = "simpleapp"

  spec {
    egress_filter {
      type = "ALLOW_ALL"
    }
  }
  tags = {
    "key" = "value"
  }
}
