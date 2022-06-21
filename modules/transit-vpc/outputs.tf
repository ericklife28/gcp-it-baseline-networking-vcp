output "gcp_region" {
  value = var.gcp_region
}

output "network_id" {
  value = google_compute_network.vpc_network.id
}

output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "network_link" {
  value = google_compute_network.vpc_network.self_link
}

output "network" {
  value = google_compute_network.vpc_network
}
