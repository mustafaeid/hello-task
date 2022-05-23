module "vault_app" {
  source = "../vault-app"

  display_name = var.display_name
  role_name    = var.role_name
}
