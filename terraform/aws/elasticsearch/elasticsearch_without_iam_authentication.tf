# fails
# todo
resource "aws_elasticsearch_domain" "no_iam" {
  domain_name           = "tf-test"
  elasticsearch_version = "2.3"
  tags                  = { test = "fail" }
}

resource "aws_elasticsearch_domain_policy" "no_iam" {
  domain_name = aws_elasticsearch_domain.no_iam.domain_name

  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Condition": {
                "IpAddress": {"aws:SourceIp": "127.0.0.1/32"}
            },
            "Resource": "${aws_elasticsearch_domain.no_iam.arn}/*"
        }
    ]
}
POLICIES
}
