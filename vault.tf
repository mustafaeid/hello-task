module "vault" {
  source = "../modules/vault"

  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  subscription_id       = data.azurerm_subscription.primary.subscription_id
  tenant_id             = data.azurerm_subscription.primary.tenant_id
  enable_standalone     = true
  enable_key_vault      = true
  domains_name          = var.domains_name
  root_certificate_name = var.root_certificate_name
  display_name          = var.display_name
  role_name             = var.vault_role_name
  vault_kms_admins = [
    data.azuread_group.aks_cluster_admins.object_id
  ]



  depends_on = [
    module.aks
  ]

}

