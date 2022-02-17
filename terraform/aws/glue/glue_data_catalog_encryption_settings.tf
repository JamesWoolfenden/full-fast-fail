# fails

# CKV_AWS_94: "Ensure Glue Data Catalog Encryption is enabled"

resource "aws_glue_data_catalog_encryption_settings" "test" {
  data_catalog_encryption_settings {
    connection_password_encryption {
      return_connection_password_encrypted = false
    }
    encryption_at_rest {
      catalog_encryption_mode = "DISABLED"
    }
  }
  tags = { test = "fail" }
}
