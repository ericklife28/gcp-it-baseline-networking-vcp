output "networks" {
  description = "Network object created by vpc module"
  value = {
    "prod" = tolist(module.vpc_prod.*.network),
    "dev"  = tolist(module.vpc_dev.*.network)
  }
}


output "subnetworks" {
  description = "Subnetwork object created by vpc module"
  value = {
    "prod" = tolist(module.vpc_prod.*.subnetwork),
    "dev"  = tolist(module.vpc_dev.*.subnetwork)
  }
}


output "secondary_range_names" {
  description = "Name of the secondary ip range created by vpc module"
  value = {
    "prod" = tolist(module.vpc_prod.*.secondary_range_name),
    "dev"  = tolist(module.vpc_dev.*.secondary_range_name)
  }
}


output "tertiary_range_names" {
  description = "Name of the tertiery ip range created by vpc module"
  value = {
    "prod" = tolist(module.vpc_prod.*.tertiary_range_name),
    "dev"  = tolist(module.vpc_dev.*.tertiary_range_name)
  }
}

