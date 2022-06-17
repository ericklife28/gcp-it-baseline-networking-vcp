resource google_compute_network_peering net1 {
  name                 = "vpcp-it-wsh-${var.peer-name-1}-001"
  network              = var.net1
  peer_network         = var.net2
  export_custom_routes = true
}


resource google_compute_network_peering net2 {
  name                 = "vpcp-it-wsh-${var.peer-name-2}-001"
  network              = var.net2
  peer_network         = var.net1
  export_custom_routes = true
}

resource google_compute_network_peering net3 {
  name                 = "vpcp-it-wsh-${var.peer-name-3}-001"
  network              = var.net3
  peer_network         = var.net2
  export_custom_routes = true
}

resource google_compute_network_peering net4 {
  name                 = "vpcp-it-wsh-${var.peer-name-4}-001"
  network              = var.net2
  peer_network         = var.net3
  export_custom_routes = true
}
