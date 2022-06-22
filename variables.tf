variable "name_prefix" {
  type    = list(string)
  default = ["dev", "prod", "transit"]
}

variable "ip_range" {
  type    = list(string)
  default = ["10.170.1.0/24", "10.170.3.0/24", "10.170.5.0/24"]
}

variable "secondary_ip_range" {
  type    = list(string)
  default = ["10.170.2.0/25", "10.170.4.0/25"]
}

variable "tertiary_ip_range" {
  type    = list(string)
  default = ["10.170.2.128/25", "10.170.4.128/25"]
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  description = "The region for this network (default us-east1)"
  type        = string
  default     = "US-EAST1"
}

variable "peer-name" {
  type    = list(string)
  default = ["devtotransit", "transittodev", "prodtotransit", "transittoprod"]
}

variable "deploy" {
  type    = bool
  default = false
}

variable "peer-name-1" {
  type    = string
  default = "devtotransit"
}

variable "peer-name-2" {
  type    = string
  default = "transittodev"
}

variable "peer-name-3" {
  type    = string
  default = "prodtotransit"
}

variable "peer-name-4" {
  type    = string
  default = "transittoprod"
}


variable "variable1" {
  type = string
}

variable "variable2" {
  type = string
}