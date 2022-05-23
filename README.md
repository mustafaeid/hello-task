# Azure Vault Terraform Module

Terraform module which creates Vault on AKS Azure Cluster.

# Dependencies

- Terraform
- Kubernetes
- Helm Chart
- Azure Account
- Key-Vault 
- Storage container & Storage account
# Requirements

| Name                                                                                                          | Version                                   |
|---------------------------------------------------------------------------------------------------------------|-------------------------------------------|
| [Terraform](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/README.md)      | ~>=3.72                                   |
| [Azure](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/README.md)          | ~> 2.90.0                                 |
| [Helm Resources](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/README.md) | ~>=2.4.1                                  |

# Providers

| Name                                                                                                          | Version                                   |
|---------------------------------------------------------------------------------------------------------------|-------------------------------------------|
| [Azure](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/README.md)          | ~> 2.90.0                                 |
| [Helm Resources](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/README.md) | ~>=2.4.1                                  |

# Modules
| Name                                                                                       | Source |
|--------------------------------------------------------------------------------------------| ------ |
| [vault](https://github.com/startup-booster/devops/tree/main/terraform/modules/vault/azure) | ../modules/vault/azure |

# Resources
| Name                                                                                                                                   | Type     |
|----------------------------------------------------------------------------------------------------------------------------------------|----------|
| [helm_release.vault](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/main.tf)                        | resource |
| [azurerm_key_vault.vault_key](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/key_vault.tf)          | resource |
| [azurerm_storage_account.azure_vault](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/blob.tf)       | resource |
| [azurerm_storage_container.vault_container](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/blob.tf) | resource |

# Inputs


| Name                                                                                          | Description                                                                                                               | Type        |
|-----------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|-------------|
| [settings](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf) | locals to modify some parameters on values.yaml for helm chart                                                            | locals(map) |
| [atomic](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                      | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to | String      |
| [key_vault_name](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                               | Specifies the name of the Key Vault. Changing this forces a new resource to be created.                                   | String      |
| [vault_name](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                   | Vault name                                                                                                                | String      |
| [location](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                     | azure region                                                                                                              | String      |
| [storage_container](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                            | The name of the Container which should be created within the Storage Account.                                             | String      |
| [storage_account](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                              | The name of the Storage Account where the Container should be created.                                                    | String      |
| [client_secret](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                | Authentication  user                                                                                                      | String      |
| [ui_enabled](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                   | To enable ui on vault                                                                                                     | Boolian     |
| [helm_release_name](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                            | The name for helm chart                                                                                                   | String      |
| [kubernetes_namespace](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                         | The name for Kubernetes namespace                                                                                         | String      |
| [subscription_id](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                              | The subscription id for account                                                                                           | String      |
| [tenant_id](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                    | The tenant id for account                                                                                                 | String      |
| [client_id](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                                    | Authentication  user                                                                                                      | String      |
| [secret_access_key](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                            | Secret Access for Key vault                                                                                               | String      |
| [resource_group_name](https://github.com/startup-booster/devops/blob/main/terraform/modules/vault/azure/variables.tf)                                                                          | The name for resource group                                                                                               | String      |




