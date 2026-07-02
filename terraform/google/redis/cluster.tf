# fail
# Cloud Memorystore for Redis Cluster must enable AUTH (HLD_GCP_195)
# Cloud Memorystore for Redis Cluster must enable in-transit encryption (HLD_GCP_196)
resource "google_redis_cluster" "fail" {
  name        = "redis-cluster-fail"
  project     = "gcp-bridgecrew-deployment"
  region      = "us-central1"
  shard_count = 1

  psc_configs {
    network = "projects/gcp-bridgecrew-deployment/global/networks/default"
  }

  authorization_mode      = "AUTH_MODE_DISABLED"
  transit_encryption_mode = "TRANSIT_ENCRYPTION_MODE_DISABLED"
}
