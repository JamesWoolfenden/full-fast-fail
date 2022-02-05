# fails
# todo sns topic name is not defined
# When your CloudTrail trails are not referencing active SNS topics anymore,
#  the cloud service can't send notifications each time Amazon CloudTrail
#  publishes new log files to the associated S3 bucket,
#  therefore you lose the ability to take immediate actions based on the log information received from Amazon CloudTrail.
resource "aws_cloudtrail" "fail" {
  # ... other configuration ...
}

resource "aws_cloudtrail" "fail2" {
  # ... other configuration ...

  sns_topic_name = null
}
