# fails
# kms
resource "aws_rds_cluster_activity_stream" "default" {
  resource_arn = aws_rds_cluster.default.arn
  mode         = "async"

  depends_on = [aws_rds_cluster_instance.default]
}
