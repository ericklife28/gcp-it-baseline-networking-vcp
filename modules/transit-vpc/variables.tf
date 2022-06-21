variable "gcp_region" {
  description = "The region for this network (default us-east1)"
  type        = string
  default     = "us-east1"
}

variable "gcp_project_id" {
  description = "The project for this network"
  type        = string
}

variable "name_prefix" {
  description = "Network object name prefix"
  type        = string
}

variable "ip_range" {
  description = "Primary ip subnet cidr"
  type        = string
}