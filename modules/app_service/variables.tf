variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "domain_name" {
  description = "The custom domain name for the App Service"
  type        = string
}

variable "app_service_url" {
  description = "The default URL of the App Service"
  type        = string
  
}
variable "custom_hostname_binding_id" {
  description = "The hostname of the App Service"
  type        = string
  
}