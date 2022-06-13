variable variable1 {
    type = "string"
}

variable dev {
    type = "string"
    default = google_compute_network.vpc_dev.self_link
}

variable prod {
    type = "string"
    default = google_compute_network.vpc_prod.self_link
}