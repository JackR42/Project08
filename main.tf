provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "project08" {
  name = "S2-RG-Project08"
  location = "westeurope"
}

