# fails
# Ensure that Azure Cache for Redis disables public network accessCheckov CKV_AZURE_89
# CKV_AZURE_148
# Ensure that only SSL are enabled for Cache for RedisCheckov CKV_AZURE_91
# todo patch_schedule' is defined
#  todo ip range is not private

resource "azurerm_redis_cache" "fail" {
  name                = "timeout-redis"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.example_rg.name
  subnet_id           = azurerm_subnet.example_redis_snet.id

  family      = "P"
  capacity    = 1
  sku_name    = "Premium"
  shard_count = 1

  enable_non_ssl_port           = true
  minimum_tls_version           = "1.1"
  public_network_access_enabled = true

  redis_configuration {
    enable_authentication = true
    maxmemory_policy      = "volatile-lru"
  }
}
