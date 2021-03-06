resource "aws_s3_bucket" "fail_permissions" {
  bucket = "S3B_181355"
  acl    = "private"

  policy = <<EOF
	{
	  "Id": "id113",
	  "Version": "2012-10-17",
	  "Statement": [
		{
		  "Action": [
			"s3:*"
		  ],
		  "Effect": "Allow",
		  "Resource": "arn:aws:s3:::S3B_181355/*",
		  "Principal": "*"
		}
	  ]
	}
  EOF
  tags   = { test = "Fail" }
}
