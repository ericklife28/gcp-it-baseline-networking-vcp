resource "google_compute_network" "vpc_network" {
  name                    = "vpc-it-wsh-${var.name_prefix}-001"
  project                 = var.gcp_project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_network" {
  project                  = var.gcp_project_id
  name                     = "sbnt-it-wsh-${var.name_prefix}-eus1-001"
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

resource "google_compute_router" "vpc_router" {
  project = var.gcp_project_id
  name    = "vpcr-it-wsh-${var.name_prefix}-eus1-001"
  network = google_compute_network.vpc_network.self_link
  region  = var.gcp_region
}

resource "google_compute_router_nat" "vpc_nat" {
  project                            = var.gcp_project_id
  name                               = "vpcn-it-wsh-${var.name_prefix}-eus1-001"
  router                             = google_compute_router.vpc_router.name
  region                             = google_compute_router.vpc_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
