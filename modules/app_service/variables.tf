variable "app_service_name" {
  description = "The name of the Azure App Service"
  type        = string
}

variable "location" {
  description = "The location for the Azure App Service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the App Service"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  type        = string
}

variable "thumbprint" {
  description = "The thumbprint of the certificate"
  type        = string
}

