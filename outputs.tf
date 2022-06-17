output network_prod {
  description = "Network object created by vpc module"
  value = module.vpc_prod.network
}


output subnetwork_prod {
  description = "Subnetwork object created by vpc module"
  value = module.vpc_prod.subnetwork
  }


output secondary_range_name_prod {
  description = "Name of the secondary ip range created by vpc module"
  value = module.vpc_prod.secondary_range_name
}


output tertiary_range_name_prod {
  description = "Name of the tertiery ip range created by vpc module"
  value = module.vpc_prod.tertiary_range_name
}

output network_dev {
  description = "Network object created by vpc module"
  value = module.vpc_dev.network
}


output subnetwork_dev {
  description = "Subnetwork object created by vpc module"
  value = module.vpc_dev.subnetwork
  }


output secondary_range_name_dev {
  description = "Name of the secondary ip range created by vpc module"
  value = module.vpc_dev.secondary_range_name
}


output tertiary_range_name_dev {
  description = "Name of the tertiery ip range created by vpc module"
  value = module.vpc_dev.tertiary_range_name
}
