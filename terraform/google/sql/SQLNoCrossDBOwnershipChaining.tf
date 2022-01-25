# fails

# tfsec
# google-sql-enable-backup
# google-sql-no-contained-db-auth
# google-sql-encrypt-in-transit-data
# google-sql-no-cross-db-ownership-chaining
# google-sql-no-public-access
resource "google_sql_database_instance" "db" {
  name             = "db"
  database_version = "SQLSERVER_2017_STANDARD"
  region           = "us-central1"
  settings {
    tier = "any_old_guff"
  }
}
