# Pki engine
resource "vault_mount" "pki" {
  type                    = "pki"
  path                    = "pki"
  max_lease_ttl_seconds   = "315360000"
}

# Root certificate
resource "vault_pki_secret_backend_root_cert" "pki_root_cert" {
  depends_on            = [vault_mount.pki]
  backend               = vault_mount.pki.path
  type                  = "internal"
  common_name           = var.root_certificate_name
  ttl                   = "315360000"
  organization          = var.organization_name
}

# Role
resource "vault_pki_secret_backend_role" "pki_role" {
  depends_on       = [vault_mount.pki]
  backend          = vault_mount.pki.path
  name             = var.root_certificate_name
  ttl              = "315360000"
  allowed_domains  = var.domains_name
  allow_subdomains = true
}