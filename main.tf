# https://faun.pub/using-terraform-to-configure-sql-server-on-azure-vm-7cdba2c1a3b3
# https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/mssql/mssqlvm/main.tf

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "example" {
  name = "S1-${var.prefix}-RG"
  location = var.location
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-VN"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
