module "vpc_dev" {
    source = "./modules/vpc"

    name_prefix = var.name_prefix[0]
    gcp_project_id = var.gcp_project_id
    ip_range = var.ip_range[0]
    secondary_ip_range = var.secondary_ip_range[0]
    tertiary_ip_range = var.tertiary_ip_range[0]
    gcp_region = var.gcp_region
    count = var.deploy ? 1 : 0 
}

module "vpc_prod" {
    source = "./modules/vpc"

    name_prefix = var.name_prefix[1]
    gcp_project_id = var.gcp_project_id
    ip_range = var.ip_range[1]
    secondary_ip_range = var.secondary_ip_range[1]
    tertiary_ip_range = var.tertiary_ip_range[1]
    gcp_region = var.gcp_region
    count = var.deploy ? 1 : 0 
}

module "vpc_transit" {
  source = "./modules/transit-vpc"

  name_prefix = var.name_prefix[2]
  gcp_project_id = var.gcp_project_id
  ip_range = var.ip_range[2]
  gcp_region = var.gcp_region
  count = var.deploy ? 1 : 0 


}

module "peering" {
  source = "./modules/peering"

  net1  = module.vpc_dev.network_link
  net2 = module.vpc_transit.network_link
  net3 = module.vpc_prod.network_link
  peer-name-1 = var.peer-name-1
  peer-name-2 = var.peer-name-2
  peer-name-3 = var.peer-name-3
  peer-name-4 = var.peer-name-4
  count = var.deploy ? 1 : 0 

}

