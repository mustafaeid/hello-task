output "vault_conf" {
  value = helm_release.vault.values
}

output "azurerm_key_vault_id" {
  value = var.enable_key_vault ? azurerm_key_vault.vault_key[0].id : null
}