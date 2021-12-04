# fails
# CKV_OPENSTACK_2: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22 (tcp / udp)"
# CKV_OPENSTACK_3: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389 (tcp / udp)"

resource "openstack_compute_secgroup_v2" "fail" {
  name        = "my_secgroup"
  description = "my security group"

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "192.168.0.0/16"
  }

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 3389
    to_port     = 3389
    ip_protocol = "tcp"
    cidr        = "192.168.0.0/16"
  }

  rule {
    from_port   = 3389
    to_port     = 3389
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
