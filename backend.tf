resource "random_id" "suffix" {
  byte_length = 2
}

module "backend" {
  source  = "../../modules/backend"

  name                = "${var.backend_storage_prefix}-${random_id.suffix.hex}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

