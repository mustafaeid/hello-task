###############
### STAGING ###
###############

env                         = "staging"
stack                       = "staging"
location_short              = "use1"
client_name                 = "1m"
resource_group_name-feature = "feature_env"

### AKS
aks_cluster_name                         = "1m-staging"
aks_cluster_log_analytics_workspace_name = "aks-staging"
aks_prefix                               = "staging"
aks_enable_role_based_access_control     = true
aks_rbac_aad_admin_group_object_ids      = "DevOps"
aks_rbac_aad_managed                     = true
aks_enable_azure_policy                  = true
aks_enable_auto_scaling                  = true
aks_enable_host_encryption               = true
aks_agents_min_count                     = 3
aks_agents_count                         = 4
aks_agents_max_count                     = 10
aks_agents_pool_name                     = "appnodepool"
aks_agents_availability_zones            = ["1", "2", "3"]
aks_network_policy                       = "azure"
aks_network_plugin                       = "azure"
aks_net_profile_dns_service_ip           = "10.30.0.10"
aks_net_profile_docker_bridge_cidr       = "170.10.0.1/16"
aks_net_profile_service_cidr             = "10.30.0.0/16"

### NETWORK
vnet_name            = "acctvnet"
vnet_address_space   = "10.0.0.0/16"
vnet_subnet_prefixes = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]


### SERVICE BUS
servicebus_namespaces_queues = {
  "1m-staging" = {
    sku = "Standard"
  }
}

### POSTGRES
postgres_db_names            = ["solaris"]
postgres_administrator_login = "dbuser"

### REDIS

### COSMOS
cosmos_stack = "solaris"

### LOGGING
coralogix_api_key = "109a4e45-0761-f47e-5dcc-2522605f44bf"

coralogix_endpoint   = "api.coralogix.us"
coralogix_sub_system = "$kubernetes.container_name-$kubernetes.namespace_name"

### STORAGE ACCOUNTS
storage_account_name = [
  "feature"
]

##### VPN

vpn_gateway_name      = "vpn_gateway"
public_ip_name        = "test"
ip_configuration_name = "vnetGatewayConfig"
subnet_address_prefix = ["10.0.64.0/20"]
virtual_network_name  = "acctvnet"




###### DNS
private_dns_link_name   = "staging-dns-link"
container_dns_zone_name = "containers.1mrobotics.dev"
virtual_network_gateway = "vpn_gateway"
dns_record_name         = ["vault", "prometheus", "grafana"]
dns_zone_name           = "private.1mrobotics.dev"
records                 = ["10.30.90.72", "10.30.214.105", "10.30.148.75"]

###### Vault
domains_name = [
  "1mrobotics.dev"
]
root_certificate_name = "1mrobotics.dev"

display_name = "vault-app-staging"

vault_role_name = "vault-role-staging"

### EVENT HUB SP
event_hub_display_name = "event-hub-sp-staging"
