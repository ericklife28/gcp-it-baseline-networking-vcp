module "vpc_dev" {
  count              = var.deploy ? 1 : 0
  source = "./modules/vpc"
  name_prefix        = var.name_prefix[0]
  gcp_project_id     = var.gcp_project_id
  ip_range           = var.ip_range[0]
  secondary_ip_range = var.secondary_ip_range[0]
  tertiary_ip_range  = var.tertiary_ip_range[0]
  gcp_region         = var.gcp_region
}

module "vpc_prod" {
  source = "./modules/vpc"
  count              = var.deploy ? 1 : 0
  name_prefix        = var.name_prefix[1]
  gcp_project_id     = var.gcp_project_id
  ip_range           = var.ip_range[1]
  secondary_ip_range = var.secondary_ip_range[1]
  tertiary_ip_range  = var.tertiary_ip_range[1]
  gcp_region         = var.gcp_region
}

module "vpc_transit" {
  source = "./modules/transit-vpc"
  count          = var.deploy ? 1 : 0
  name_prefix    = var.name_prefix[2]
  gcp_project_id = var.gcp_project_id
  ip_range       = var.ip_range[2]
  gcp_region     = var.gcp_region
}

module "peering_dev_transit" {
  count       = var.deploy ? 1 : 0
  source      = "./modules/peering"
  net1        = module.vpc_dev[0].network_link
  net2        = module.vpc_transit[0].network_link
  peer-name-1 = var.peer-name-1
  peer-name-2 = var.peer-name-2
}


module "peering_prod_transit" {
  count       = var.deploy ? 1 : 0
  source      = "./modules/peering"
  net1        = module.vpc_prod[0].network_link
  net2        = module.vpc_transit[0].network_link
  peer-name-1 = var.peer-name-3
  peer-name-2 = var.peer-name-4
}
