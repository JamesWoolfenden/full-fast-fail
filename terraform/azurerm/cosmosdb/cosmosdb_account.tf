# fails
# Ensure Cosmos DB accounts have restricted accessCheckov CKV_AZURE_99
# Ensure cosmosdb does not allow privileged escalation by restricting management plane changesCheckov CKV_AZURE_132
# Ensure that Azure Cosmos DB disables public network accessCheckov CKV_AZURE_101
# Ensure that Cosmos DB accounts have customer-managed keys to encrypt data at restCheckov CKV_AZURE_100
# Ensure that Local Authentication is disabled on CosmosDBCheckov (CKV_AZURE_140)
# todo Ensure cosmos db firewall is enabled (R.2.3) ? ip_range_filter is set?
# todo Ensure that the 'Accept connections from within public Azure datacenters' option is disabled (R.2.4) ip_range_filter doesnt not contain 0.0.0.0
# todo Ensure that the Cross-Origin Resource Sharing (CORS) feature to be enabled (R.2.6) cors rule?
resource "azurerm_cosmosdb_account" "fail" {
  name                = "tfex-cosmos-db-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true
  ip_range_filter           = ["0.0.0.0"]
  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
  tags = {
    "key" = "value"
  }
}
