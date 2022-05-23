resource "azurerm_postgresql_database" "vault" {
  count = var.enable_ha ? 1 : 0

  charset             = var.charset
  collation           = var.collation
  name                = var.postgres_db_name
  resource_group_name = var.resource_group_name
  server_name         = var.postgres_server_name

  provisioner "local-exec" {
    command = "PGPASSWORD=${var.postgres_vault_password} psql --host ${var.postgres_server_name} --port=5432 --username=${var.postgres_vault_user}"
  }
}

