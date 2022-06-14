variable name_prefix {
  type = list(string)
  default = ["dev", "prod"]
}

variable ip_range {
  type = list(string)
  default = [ "10.170.1.0/24", "10.170.3.0/24" ]  
}

variable secondary_ip_range {
  type = list(string)
  default = [ "10.170.2.0/25", "10.170.4.0/25"]  
}

variable tertiary_ip_range {
  type = list(string)
  default = [ "10.170.2.128/25", "10.170.4.128/25"]  
}

variable "gcp_project_id" {
  type    = string
  default = "Secret"
}



variable "variable1" {
  type = string
}

variable "variable2" {
  type = string
}