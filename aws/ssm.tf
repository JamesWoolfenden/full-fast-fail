resource "aws_ssm_document" "s3_enabled_not_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: 'example'
    s3KeyPrefix: ''
    s3EncryptionEnabled: false
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: false
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
}
