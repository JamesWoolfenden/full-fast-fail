# fails
# CKV_AWS_75: "Ensure Global Accelerator accelerator has flow logs enabled"

# tfsec

resource "aws_glacier_vault" "my_archive2" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": {
            "AWS": [
                "arn:aws:iam::123456789101:role/vault-reader",
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags          = { test = "fail" }
}
