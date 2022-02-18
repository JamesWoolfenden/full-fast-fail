# fails
# Ensure Storage logging is enabled for Table service for read requestsCheckov CKV2_AZURE_20
# todo ensure acl.access_policy.permission is not rwdl
resource "azurerm_storage_table" "table_resource" {
  name                 = "my_table_name"
  storage_account_name = "mystoragexxx"
  acl {
    id = "someid-1XXXXXXXXX"
    access_policy {
      expiry      = "2022-10-03T05:05:00.0000000Z"
      permissions = "rwdl"
      start       = "2021-05-28T04:05:00.0000000Z"
    }
  }
}
