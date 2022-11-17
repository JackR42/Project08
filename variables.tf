variable "prefix" {
  description = "The prefix to be used for all resources."
}

variable "LOCATION" {
  description = "Azure Region"
}
variable "SREG" {
  description = "Sub Region code."
}
variable "ENVTYPE" {
  description = "The environment type (e.g. NPR, PRD)."
}
variable "VNET" {
  description = "The name of the shared service VNET"
}
variable "NETWORK_RESOURCE_GROUP" {
  description = "The name of the Network resource group"
}
variable "SQL_SUBNET_ADDRESS" {
  description = "CIDR for the Gateway Subnet"
}
variable "ADMIN_PASSWORD" {
  description = "Admin Password for the VM's"
  sensitive   = true
}
variable "APP" {
  description = "Purpose of the infrastructure"
}
# Tag Variables
variable "TAG_BUSINESS_UNIT" {
  description = "Tag to be added to the resource describing the business unit"
}
variable "TAG_CREATED_DATE" {
  description = "Tag to be added to the resource with the date of creation"
}
variable "ACTIVITY_TAG" {
  description = "Purpose of the deployment, e.g. AD, SQL, Application"
}
# VM Vars
variable "VM_SIZE_APP" {
  description = "VM Size App Server"
}
variable "VM_SIZE_SQL" {
  description = "VM Size SQL Server"
}
variable "VM_OS_DISK_DELETE_FLAG" {
  description = "Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed?"
  default     = "true"
}
variable "VM_DATA_DISK_DELETE_FLAG" {
  description = "Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed?"
  default     = "true"
}
variable "PUBLISHER_APP" {
  description = "image publisher"
}
variable "OFFER_APP" {
  description = "image offer"
}
variable "SKU_APP" {
  description = "sku of the image"
}
variable "IMAGE_VERSION_APP" {
  description = "version for the image"
}
variable "SQLADMINPWD" {
  description = "SQL admin password"
  sensitive   = true
}
variable "SQLADMIN" {
  description = "SQL admin username"
  sensitive   = true
}
variable "SQLDATAFILEPATH" {
  description = "SQL data file path"
}
variable "SQLLOGFILEPATH" {
  description = "SQL log file path"
}
variable "PUBLISHER_SQL" {
  description = "image publisher"
}
variable "OFFER_SQL" {
  description = "image offer"
}
variable "SKU_SQL" {
  description = "sku of the image"
}
variable "IMAGE_VERSION_SQL" {
  description = "version for the image"
}
#LOG ANALYTICS
variable "LAW" {
  description = "Log analytics workspace"
}
variable "LAWRG" {
  description = "Log analytics workspace resource group"
}
