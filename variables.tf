# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine

variable "resource_group_name" {
  description = "name of the Resource Group in which the Virtual Machine should exist."
}
variable "location" {
  description = "Azure Region where the Virtual Machine exists."
}
variable "vm_subnet_id" {
  description = "ID of the subnet the VM should be a member of."
}
variable "vm_name" {
  description = "name of the Virtual Machine. "
}
variable "computer_name" {
  description = "name of the Virtual Machine."
}
variable "vm_size" {
  description = "size of the Virtual Machine."
}
variable "static_ip_address" {
  description = "Static Ip address"
}
variable "activity_tag" {
  description = "Purpose of the deployment, e.g. AD, SQL, Application"
}
variable "admin_password" {
  description = "Local admin password on the virtual machine."
  sensitive   = true
}
variable "admin_username" {
  description = "Local admin username on the virtual machine."
  sensitive   = true
}
variable "vm_os_disk_delete_flag" {
  description = "Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed?"
  default     = true
}
variable "vm_data_disk_delete_flag" {
  description = "Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed?"
  default     = true
}
variable "network_security_group_id" {
  description = "NSG ID"
  default     = ""
}
variable "tags" {
  description = "Map of tags"
}
variable "availability_set_id" {
  description = "ID of the availability set"
}
variable "storage_uri" {
  description = "Storage account URI for boot diagnostics"
}
variable "publisher" {
  description = "image publisher"
}
variable "offer" {
  description = "image offer"
}
variable "sku" {
  description = "sku of the image"
}
variable "image_version" {
  description = "version for the image"
}
variable "sql_connectivity_update_password" {
  description = "sql password"
  sensitive   = true
}
variable "sql_connectivity_update_username" {
  description = "sql username"
  sensitive   = true
}
variable "default_file_path_data" {
  description = "SQL Data file path"
}
variable "default_file_path_log" {
  description = "SQL Log file path"
}
