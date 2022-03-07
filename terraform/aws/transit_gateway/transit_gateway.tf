# fails
# todo TransitGateway should have options.defaultRouteTableAssociation='disable'
# todo and options.defaultRouteTablePropagation='disable'
# In order to control your VPC environment and Transit gateway, prefer setting the
# associations and propagations for your transit gateway manually
# todo ensure auto_accept_shared_attachment=disable
resource "aws_ec2_transit_gateway" "fail" {
  defaultRouteTablePropagation    = "enable" #default
  default_route_table_propagation = "enable" #default
  auto_accept_shared_attachment   = "enable" #default=disable
  description                     = "example"
  tags = {
    test = "fail"
  }
}
