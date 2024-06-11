variable "dns_zone_name" {
  description = "The name of the Azure DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the DNS zone"
  type        = string
}


variable "domain_name" {
  description = "The root domain name"
  type        = string
}

variable "subdomain_name" {
  description = "The subdomain name"
  type        = string
}

variable "machine_ip" {
  description = "The IP address of the machine"
  type        = string
}

variable "dns_zone_id" {
  description = "The ID of the DNS zone"
  type        = string
  
}
