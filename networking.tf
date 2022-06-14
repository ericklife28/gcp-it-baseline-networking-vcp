module "vpc_dev" {
    source = "./modules/vpc"

    name_prefix = var.name_prefix[0]
    gcp_project_id = var.gcp_project_id
    ip_range = var.ip_range[0]
    secondary_ip_range = var.secondary_ip_range[0]
    tertiary_ip_range = var.tertiary_ip_range[0]
}

module "vpc_prod" {
    source = "./modules/vpc"

    name_prefix = var.name_prefix[1]
    gcp_project_id = var.gcp_project_id
    ip_range = var.ip_range[1]
    secondary_ip_range = var.secondary_ip_range[1]
    tertiary_ip_range = var.tertiary_ip_range[1]
}

module "peering" {
  source = "./modules/peering"

  dev  = module.vpc_dev.network_link
  prod = module.vpc_prod.network_link

}

