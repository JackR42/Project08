provider "azurerm" {
  version = "~> 1.35.0"
}

terraform {
#  required_version = "~> 0.12.0"
  backend "azurerm" {}
}

resource "azurerm_resource_group" "project08" {
  name = "S1-RG-Project08"
  location = "westeurope"
}

resource "azurerm_resource_group" "MyRG" {
   name     = "${var.rgname}"
   location = "${var.rglocation}"
}

module "vm1" {
  source   = "./Modules/vm1"
  rgname   = "${azurerm_resource_group.MyRG.name}"
  location = "${azurerm_resource_group.MyRG.location}"
  nicID    = "${azurerm_network_interface.myterraformnicwindows.id}"
  vmname   = "${var.windowsvmname}"
 } 
