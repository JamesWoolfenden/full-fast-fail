# fails
# todo
# kms_encrypted - (Optional) Boolean value if true to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Defaults to false.
# kms_key_arn - (Optional) Amazon Resource Name (ARN) for KMS key used for Amazon S3 server side encryption. This value can only be set when kms_encrypted is true.

resource "aws_storagegateway_stored_iscsi_volume" "example" {
  gateway_arn            = aws_storagegateway_cache.example.gateway_arn
  network_interface_id   = aws_instance.example.private_ip
  target_name            = "example"
  preserve_existing_data = false
  disk_id                = data.aws_storagegateway_local_disk.test.id
}
