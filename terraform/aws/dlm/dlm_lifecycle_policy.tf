# fails

# dlm events
#  cross region copy rule encrypted =true and cmk_arn is set check
#  action/cross_region_copy/encryption_configuration
# encrypted = true
# cmk_arn   = aws_kms_key.dlm_cross_region_copy_cmk.arn
# dlm schedule
# if policy_details/schedule/cross_region_copy_rule
# encrypted = true
# cmk_arn   = aws_kms_key.dlm_cross_region_copy_cmk.arn
resource "aws_dlm_lifecycle_policy" "fail_schedule" {
  description        = "example DLM lifecycle policy"
  execution_role_arn = aws_iam_role.dlm_lifecycle_role.arn
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "2 weeks of daily snapshots"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["23:45"]
      }

      retain_rule {
        count = 14
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }

      copy_tags = false

      cross_region_copy_rule {
        target    = "us-west-2"
        encrypted = false
        # cmk_arn   = aws_kms_key.dlm_cross_region_copy_cmk.arn
        copy_tags = true
        retain_rule {
          interval      = 30
          interval_unit = "DAYS"
        }
      }
    }

    target_tags = {
      Snapshot = "true"
    }
  }
  tags = {
    test = "failed"
  }
}


resource "aws_kms_key" "dlm_cross_region_copy_cmk" {
  enable_key_rotation = true
}

resource "aws_iam_role" "dlm_lifecycle_role" {
  assume_role_policy = ""
}

provider "aws" {
  profile = "default"
}

resource "aws_dlm_lifecycle_policy" "fail_event" {
  description        = "tf-acc-basic"
  execution_role_arn = aws_iam_role.example.arn

  policy_details {
    policy_type = "EVENT_BASED_POLICY"

    action {
      name = "tf-acc-basic"
      cross_region_copy {
        encryption_configuration {}
        retain_rule {
          interval      = 15
          interval_unit = "MONTHS"
        }

      }
    }

    event_source {
      type = "MANAGED_CWE"
      parameters {
        description_regex = "^.*Created for policy: policy-1234567890abcdef0.*$"
        event_type        = "shareSnapshot"
        snapshot_owner    = [data.aws_caller_identity.current.account_id]
      }
    }
  }
}
