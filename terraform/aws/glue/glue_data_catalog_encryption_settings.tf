# fails

# CKV_AWS_94: "Ensure Glue Data Catalog Encryption is enabled"
# todo kms key used to encrpyt password connection
# todo kms used to encrypt at rest
resource "aws_glue_data_catalog_encryption_settings" "test" {
  data_catalog_encryption_settings {
    connection_password_encryption {
      return_connection_password_encrypted = false
      # aws_kms_key_id =
    }
    encryption_at_rest {
      catalog_encryption_mode = "DISABLED"
      #  sse_aws_kms_key_id =
    }
  }
  tags = { test = "fail" }
}
