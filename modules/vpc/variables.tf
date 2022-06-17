variable gcp_region {
  description = "The region for this network (default us-east1)"
  type        = string
  default     = "us-east1"
}

variable gcp_project_id {
  description = "The project for this network"
  type        = string
}

variable name_prefix {
  description = "Network object name prefix"
  type        = string
}


variable ip_range {
  description = "Primary ip subnet cidr (should be in 10.170.0.0/16) -- contact devops for allocation"
  type        = string
  default     = "10.170.1.0/24"
}

variable secondary_ip_range {
  description = "Secondary ip subnet range (should be next network after ip_range) -- contact devops for allocation"
  type        = string
  default     = "10.170.2.128/25"
}

variable tertiary_ip_range {
  description = "Tertiary ip subnet range (should be next network after secondary_ip_range) -- contact devops for allocation"
  type        = string
  default     = "10.170.2.0/25"
}

