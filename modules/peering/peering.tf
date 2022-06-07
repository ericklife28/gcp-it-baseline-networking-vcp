// Peering for mcc-digital project
resource google_compute_network_peering prod {
  name                 = "peer-production"
  network              = data.google_compute_network.default.self_link
  peer_network         = "projects/mcc-digital/global/networks/terraform-network"
  export_custom_routes = true
}

// Peering for mcc-digital-build project
resource google_compute_network_peering build {
  name                 = "peer-build"
  network              = data.google_compute_network.default.self_link
  peer_network         = "projects/mcc-digital-build/global/networks/packer"
  export_custom_routes = true
}

data google_compute_network default {
  name = "default"
}
