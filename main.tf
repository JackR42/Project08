provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "project08" {
  name = "S1-RG-Project08"
  location = "westeurope"
}

