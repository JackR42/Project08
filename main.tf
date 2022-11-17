# https://faun.pub/using-terraform-to-configure-sql-server-on-azure-vm-7cdba2c1a3b3

terraform {
  backend "azurerm" { 
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.62.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#resource "azurerm_resource_group" "rg" {
#  name = "S1-${var.prefix}RG"
#  location = var.location
#}
