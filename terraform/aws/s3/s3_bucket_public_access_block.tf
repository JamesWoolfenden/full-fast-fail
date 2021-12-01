
resource "aws_s3_bucket_public_access_block" "fail" {
	bucket = aws_s3_bucket.fail.id
}
