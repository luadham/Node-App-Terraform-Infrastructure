variable "region" {
  default = "us-east-1"
}

variable "zone_a" {
  default = "us-east-1a"
}

variable "zone_b" {
  default = "us-east-1b"
}

variable "vpc_cider" {
  default = "172.0.0.0/16"
}

variable "public_subnet_a_cider" {
  default = "172.0.1.0/24"
}


variable "public_subnet_b_cider" {
  default = "172.0.4.0/24"
}


# Application Variables
variable "application_port" {
  default = "8080"
}

variable "health_end_point" {
  default = "/health"
}