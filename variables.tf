###############
### BACKEND ###
###############

variable "backend_storage_prefix" {
  default = "tfstate-backend"
}

variable "resource_group_name" {
  type = string
  default = "backend"
}

variable "resource_group_location" {
  default = "East US"
}