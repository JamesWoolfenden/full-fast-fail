resource "aws_ec2_tag" "example" {
  resource_id = aws_vpn_connection.example.transit_gateway_attachment_id
}
