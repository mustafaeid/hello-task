resource "azurerm_key_vault" "vault_key" {
  count = var.enable_key_vault ? 1 : 0

  name                        = "${var.key_vault_name}-${random_id.id.hex}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = module.vault_app.vault_app_service_principle_id



    key_permissions = [
      "Get",
      "Create",
      "Backup",
      "Decrypt",
      "Delete",
      "Encrypt",
      "Import",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Sign",
      "UnwrapKey",
      "Update",
      "Verify",
      "WrapKey"
    ]

    secret_permissions = [
      "Get",
      "Backup",
      "Delete",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = [
      "Get",
      "Backup",
      "Delete",
      "DeleteSAS",
      "GetSAS",
      "List",
      "ListSAS",
      "Recover",
      "RegenerateKey",
      "Restore",
      "Set",
      "SetSAS",
      "Update"
    ]

    certificate_permissions = [
      "Get",
      "Backup",
      "Create",
      "Delete",
      "DeleteIssuers",
      "GetIssuers",
      "Import",
      "List",
      "ListIssuers",
      "ManageContacts",
      "ManageIssuers",
      "Purge",
      "Recover",
      "Restore",
      "SetIssuers",
      "Update"
    ]
  }

  dynamic "access_policy" {
    for_each = var.vault_kms_admins

    content {
      tenant_id = var.tenant_id
      object_id = access_policy.value

      key_permissions = [
        "Get",
        "Create",
        "Backup",
        "Decrypt",
        "Delete",
        "Encrypt",
        "Import",
        "List",
        "Purge",
        "Recover",
        "Restore",
        "Sign",
        "UnwrapKey",
        "Update",
        "Verify",
        "WrapKey"
      ]

      secret_permissions = [
        "Get",
        "Backup",
        "Delete",
        "List",
        "Purge",
        "Recover",
        "Restore",
        "Set"
      ]

      storage_permissions = [
        "Get",
        "Backup",
        "Delete",
        "DeleteSAS",
        "GetSAS",
        "List",
        "ListSAS",
        "Purge",
        "Recover",
        "RegenerateKey",
        "Restore",
        "Set",
        "SetSAS",
        "Update"
      ]
    }
  }
}


resource "azurerm_key_vault_key" "vault_key" {
  count = var.enable_key_vault ? 1 : 0

  key_opts = [
    "decrypt",
    "encrypt",
    "wrapKey",
    "verify",
    "unwrapKey",
    "sign"




  ]
  key_type     = "RSA"
  key_size     = 2048
  key_vault_id = azurerm_key_vault.vault_key[0].id
  name         = "vault-key"
}