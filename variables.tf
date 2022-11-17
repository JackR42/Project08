# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine
# https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/mssql/mssqlvm/variables.tf

variable "location" {
  description = "The Azure location where all resources are created."
}

variable "prefix" {
  description = "The prefix used for all resources."
}

variable "vmname" {
  description = "The of the Virtual Machine"
}

variable "admin" {
  description = "The name of the Administrator."
}

variable "adminpwd" {
  description = "The password of the Administrator."
}
