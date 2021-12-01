# fail
# CKV_AWS_183: "Ensure EBS Snapshot Copy is encrypted by KMS using a customer managed Key (CMK)"


resource "aws_ebs_snapshot_copy" "fail" {
  source_snapshot_id = aws_ebs_snapshot.test.id
  source_region      = data.aws_region.current.name
  encrypted          = true

  tags = {
    Name = "testAccEBSSnapshotCopyWithKMSConfig"
  }
}
