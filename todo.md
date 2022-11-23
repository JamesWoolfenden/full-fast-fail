# New checks for beginners

* New Resource: aws_comprehend_entity_recognizer (#26244)
    * model_kms_key_id is set - uses CMK
    * volume_kms_key_id is set -  uses CMK

* New Resource: aws_connect_instance_storage_config (#26152)
    * Kinesis video stream uses CMK (kinesis_video_stream_config/encryption_config/key_id is set)
    * s3_config/encryption_config/key_id is set

* New Resource: aws_dynamodb_table_replica (#26250)
    * Kms-key_arn is set  uses CMK

# New Graph Checks:

Convert any TF graph check that isn’t match by a cloudformation one or these two:

## Check that route53 zone always has a matching query log

“Ensure that Domain Name System (DNS) query logging is enabled for your Amazon Route 53 hosted zones in order to address DNS security and compliance requirements. This allows Amazon Route 53 to log information about the queries that Route 53 receives, such as the domain or subdomain that was requested, the date and time of the query, the DNS record type (e.g. A or AAAA), and the DNS response code, such as "NoError" or "ServFail". Once the DNS query logging is enabled and configured, Amazon Route 53 will send the log files to Amazon CloudWatch Logs.”

resource "aws_route53_zone" “example” {
  name = "example.com"
}

resource "aws_route53_query_log" “example” {
  cloudwatch_log_group_arn = aws_cloudwatch_log_group.example.arn
 zone_id                  = aws_route53_zone.example.zone_id
}

## Check that Route53 Zones Enable DNSSEC Signing

Check that any aws_route53_zone has a an associated aws_route53_hosted_zone_dnssec resource

“Ensure that Domain Name System Security Extensions (DNSSEC) signing is enabled for your Amazon Route 53 public hosted zones in order to protect your domains against spoofing and cache poisoning attacks. By default, DNSSEC signing is not enabled for Route 53 hosted zones.”
