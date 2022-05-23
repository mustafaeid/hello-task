locals {
  postgres_enabled = var.enable_ha ? "postgres://${var.postgres_vault_user}:${var.postgres_vault_password}@${var.postgres_server_name}/vault?sslmode=verify-full" : ""
}

resource "helm_release" "vault" {
  atomic           = var.atomic
  name             = var.helm_release_name
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "vault"
  version          = "0.18.0"
  create_namespace = true
  namespace        = var.kubernetes_namespace


  values = [
    templatefile("${path.module}/templates/values.tmpl", {
      ui_enabled                = var.ui_enabled
      storage_account_name      = local.storage_acoount_name
      storage_account_container = azurerm_storage_container.vault_container[0].name
      storage_environment       = var.storage_environment
      postgres_connection_url   = local.postgres_enabled
      tenant_id                 = var.tenant_id
      client_id                 = module.vault_app.vault_app_client_id
      client_secret             = module.vault_app.vault_app_client_secret
      vault_name                = var.enable_key_vault == true ? azurerm_key_vault.vault_key[0].name : ""
      enable_standalone         = var.enable_standalone
      enable_ha                 = var.enable_ha
      table                     = var.postgres_table
      ha_table                  = var.postgres_ha_table
      key_name                  = var.enable_key_vault == true ? azurerm_key_vault_key.vault_key[0].name : ""
      storage_account_key       = azurerm_storage_account.azure_vault[0].primary_access_key
    })
  ]

  depends_on = [
    azurerm_storage_container.vault_container,
    azurerm_key_vault.vault_key
  ]
}

resource "random_id" "id" {
  byte_length = 8
}

resource "random_password" "vault" {
  length           = 16
  special          = true
  override_special = "_%@"
}

