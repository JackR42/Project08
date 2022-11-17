# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine
# https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/mssql/mssqlvm/variables.tf

variable "location" {
  description = "The Azure location where all resources are created."
}

variable "prefix" {
  description = "The prefix used for all resources."
}
