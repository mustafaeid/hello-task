locals {
  storage_acoount_name = var.create_storage_account ? var.storage_account_prefix : azurerm_storage_account.azure_vault[0].name
}

resource "azurerm_storage_account" "azure_vault" {
  count = var.enable_standalone ? 1 : 0

  name                     = "${var.storage_account_prefix}${random_id.id.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "vault_container" {
  count = var.enable_standalone ? 1 : 0

  name                  = var.storage_container
  storage_account_name  = local.storage_acoount_name
  container_access_type = "private"
}