// Peering for mcc-digital project
resource google_compute_network_peering dev {
  name                 = "peer-dev"
  network              = var.dev
  peer_network         = var.prod
  export_custom_routes = true
}

// Peering for mcc-digital-build project
resource google_compute_network_peering prod {
  name                 = "peer-prod"
  network              = var.prod
  peer_network         = var.dev
  export_custom_routes = true
}


