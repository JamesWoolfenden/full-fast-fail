# fails
# CKV_AWS_164: "Ensure Transfer Server is not exposed publicly."

resource "aws_transfer_server" "example" {
  protocols = ["SFTP"]
  tags      = { test = "fail" }
}
