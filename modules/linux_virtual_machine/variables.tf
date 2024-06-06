variable "vm_name" {
  description = "The name of the Linux virtual machine"
  type        = string
}

variable "location" {
  description = "The location of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
}

variable "vm_size" {
  description = "The size of the Linux virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Linux virtual machine"
  type        = string
}

# variable "admin_ssh_key" {
#   description = "The admin SSH key for the Linux virtual machine"
#   type        = string
# }

variable "subnet_id" {
  description = "value of subnet_id"
  type        = string
}

# variable "parent_id" {
#   description = "resource group id"
#   type = string
# }