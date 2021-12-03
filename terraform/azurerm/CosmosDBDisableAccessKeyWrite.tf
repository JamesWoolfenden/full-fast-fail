
resource "azurerm_cosmosdb_account" "db" {
  name     = "tfex-cosmos-db-${random_integer.ri.result}"
  location = azurerm_resource_group.rg.location
}
