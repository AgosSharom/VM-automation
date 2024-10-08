variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Location (e.g., North Europe)"
  type        = string
}

variable "vnet_name" {
  description = "Existing Virtual Network name"
  type        = string
}

variable "subnet_name" {
  description = "Existing Subnet name"
  type        = string
}

variable "vnet_resource_group" {
  description = "Resource Group for the Virtual Network"
  type        = string
}

variable "number_of_vms" {
  description = "Number of VMs to be created"
  type        = number
}

variable "vm_size" {
  description = "Size of the VMs (e.g., Standard_D8as_v5)"
  type        = string
}

variable "os_disk_size" {
  description = "OS Disk Size in GB"
  type        = number
}

variable "os_version" {
  description = "Operating System Version (e.g., 2022)"
  type        = string
}

variable "vm_details" {
  description = "Details for each VM, such as names and NIC configurations"
  type = list(object({
    vm_name       = string
    nic_name      = string
    ipconfig_name = string
    os_disk_name  = string
  }))
}

# New variables for updating NIC IP to static
variable "nic_name" {
  description = "Name of the existing Network Interface"
  type        = string
}

variable "static_ip_address" {
  description = "Static IP Address to assign to the NIC"
  type        = string
}
