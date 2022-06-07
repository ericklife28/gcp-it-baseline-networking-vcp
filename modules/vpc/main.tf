resource google_compute_network vpc_network {
  name                    = "${var.name_prefix}-network"
  project                 = var.gcp_project_id
  auto_create_subnetworks = false
}

resource google_compute_subnetwork vpc_network {
  name                     = google_compute_network.vpc_network.name
  ip_cidr_range            = var.ip_range
  region                   = var.gcp_region
  network                  = google_compute_network.vpc_network.self_link
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "${google_compute_network.vpc_network.name}-secondary-range"
    ip_cidr_range = var.secondary_ip_range
  }
  secondary_ip_range {
    range_name    = "${google_compute_network.vpc_network.name}-tertiary-range"
    ip_cidr_range = var.tertiary_ip_range
  }
}

resource google_compute_subnetwork proxy_subnet {
  count         = var.enable_proxy_subnet ? 1 : 0
  name          = "${var.name_prefix}-proxy-subnet"
  description   = "A project-private proxy subnet used by the internal http(s) load balancer"
  ip_cidr_range = "10.100.100.0/24"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.self_link
}

resource google_compute_router vpc_router {
  name    = "${var.name_prefix}-router"
  network = google_compute_network.vpc_network.self_link
  region  = var.gcp_region
}

resource google_compute_router_nat vpc_nat {
  name                               = "${var.name_prefix}-router-nat"
  router                             = google_compute_router.vpc_router.name
  region                             = google_compute_router.vpc_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource google_compute_network_peering vpc_peer {
  count                = var.peering ? 1 : 0
  name                 = "${var.name_prefix}-peering"
  network              = google_compute_network.vpc_network.self_link
  peer_network         = "projects/${var.peering_project_id}/global/networks/${var.peering_network_name}"
  import_custom_routes = true
}

