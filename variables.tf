variable "atomic" {
  default = true
}

variable "key_vault_name" {
  default = "vault"
}

variable "vault_name" {
  default = "vault"
}

variable "location" {
  description = "azure region to deploy this resource"
}

variable "create_storage_account" {
  type    = bool
  default = false
}

variable "ui_enabled" {
  default = true
}

variable "helm_release_name" {
  default = "vault"
}

variable "kubernetes_namespace" {
  type        = string
  description = "The name of Kubernetes namespace to deploy Vault into"
  default     = "vault"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
}

variable "tenant_id" {
  description = "The Azure tenant ID"
}

variable "vault_kms_admins" {
  type        = list(string)
  description = "To allow TF run not to fail on 403 need to grant access to admins"
}

variable "enable_key_vault" {
  description = "To disable the key vault generation"
  default     = true
}

variable "secret_access_key" {
  description = "The Azure secret access key"
  default     = null
}

variable "resource_group_name" {
  description = "The name of the Azure resource group consul will be deployed into. This RG should already exist"
}

variable "enable_standalone" {
  description = "(Optional) relevant for Azure backend storage"
  default     = false
}

variable "enable_ha" {
  description = "(Optional) relevant for postgres backend storage"
  default     = false
}

################
### POSTGRES ###
################

variable "postgres_db_name" {
  description = "Specifies the name of the PostgreSQL Database, which needs to be a valid PostgreSQL identifier. Changing this forces a new resource to be created."
  default     = "vaultdb"
}

variable "postgres_server_name" {
  description = "Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created."
  default     = null
}

variable "charset" {
  description = "Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset. Changing this forces a new resource to be created."
  default     = "UTF8"
}

variable "collation" {
  description = "Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation. Note that Microsoft uses different notation - en-US instead of en_US. Changing this forces a new resource to be created."
  default     = "English_United States.1252"
}

variable "postgres_table" {
  description = "The main table to store key/value"
  default     = "vault_kv_store"
}

variable "postgres_ha_table" {
  description = "The table name for the HA"
  default     = "vault_ha_locks"
}

variable "postgres_vault_user" {
  description = "The username to login the postgres DB. relevant only when using postgres as a backend"
  default     = null
}
variable "postgres_vault_password" {
  description = "The password to login the postgres DB. relevant only when using postgres as a backend"
  default     = null
}

############
### BLOB ###
############

variable "storage_container" {
  description = "azure storage container"
  default     = "vault"
}

variable "storage_account_prefix" {
  default = "vault"
}

variable "storage_environment" {
  description = " Specifies the cloud environment the storage account belongs to by way of the case-insensitive name defined in the Azure Go SDK."
  default     = "AzurePublicCloud"
}

############
### PKI ###
############

variable "root_certificate_name" {

  description = "the name for root certificate"
}

variable "domains_name" {}

variable "organization_name" {
  default = "1MRobotics"
}

###############
#azuread_access#
#################

variable "display_name" {
  type        = string
  description = "The application name"
}

variable "role_name" {
  description = "the name for role used"
}






