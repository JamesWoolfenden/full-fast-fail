# fail
# CKV_AWS_114
# CKV2_AWS_7: "Ensure that Amazon EMR clusters' security groups are not open to the world"
# CKV_AWS_25: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389"
# CKV_AWS_23: "Ensure every security groups rule has a description"
# CKV_AWS_24: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22"
# CKV_AWS_114: "Ensure that EMR clusters with Kerberos have Kerberos Realm set"

resource "aws_emr_cluster" "test" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  termination_protection            = false
  keep_job_flow_alive_when_no_steps = true

  kerberos_attributes {
    kdc_admin_password = "somePassword"
  }
  tags = {
    "key" = "value"
  }
}
