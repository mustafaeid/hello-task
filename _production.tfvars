###############
### production ###
###############

env                         = "production"
stack                       = "production"
location_short              = "use1"
client_name                 = "1m"
resource_group_name-feature = "pfeature"

### AKS
aks_cluster_name                         = "1m-production"
aks_cluster_log_analytics_workspace_name = "aks-production"
aks_prefix                               = "production"
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
aks_net_profile_dns_service_ip           = "10.20.0.10"
aks_net_profile_docker_bridge_cidr       = "170.20.0.1/16"
aks_net_profile_service_cidr             = "10.20.0.0/16"

### NETWORK
vnet_name            = "production"
vnet_address_space   = "10.1.0.0/16"
vnet_subnet_prefixes = ["10.1.0.0/20", "10.1.16.0/20", "10.1.32.0/20"]


### SERVICE BUS
servicebus_namespaces_queues = {
  "1m-production" = {
    sku = "Standard"
  }
}

### EVENT HUB SP
event_hub_display_name = "event-hub-sp-production"

### POSTGRES
postgres_db_names            = ["solaris"]
postgres_administrator_login = "dbuser"

### REDIS

### COSMOS
cosmos_stack = "solaris"

### LOGGING
coralogix_api_key    = "743d2f2a-7808-03c4-faf7-0de88f3327ef"
coralogix_endpoint   = "api.coralogix.us"
coralogix_sub_system = "$kubernetes.container_name-$kubernetes.namespace_name"

### STORAGE ACCOUNTS
storage_account_name = [
  "pfeature"
]

##### VPN

vpn_gateway_name      = "vpn_gateway_production"
public_ip_name        = "1m_production_ip"
ip_configuration_name = "vnetGatewayConfig"
subnet_address_prefix = ["10.1.64.0/18"]
virtual_network_name  = "production"
###### DNS
private_dns_link_name   = "production-dns-link"
container_dns_zone_name = "containers.1mrobotics.com"
virtual_network_gateway = "vpn_gateway_production"
dns_record_name         = ["vault", "prometheus", "grafana"]
dns_zone_name           = "private.1mrobotics.com"
records                 = ["10.20.138.37", "10.20.27.181", "10.20.218.194"]

###### Vault
domains_name = [
  "1mrobotics.com"
]

root_certificate_name = "1mrobotics.com"

display_name = "vault-app-production"

vault_role_name = "vault-role-production"

