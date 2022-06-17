resource google_compute_network vpc_transit_network {
  name                    = "vpc-it-wsh-${var.name_prefix}-001"
  project                 = var.gcp_project_id
  auto_create_subnetworks = false
}

resource google_compute_subnetwork vpc_transit_network {
  name                     = "sbnt-it-wsh-${var.name_prefix}-eus1-001"
  ip_cidr_range            = var.ip_range
  region                   = var.gcp_region
  network                  = google_compute_network.vpc_transit_network.self_link
  private_ip_google_access = true

}

