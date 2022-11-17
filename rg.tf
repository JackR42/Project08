# Pull exisiting network resource group
data "azurerm_resource_group" "rsg" {
  name = var.NETWORK_RESOURCE_GROUP
}

# Create SQL resource group
resource "azurerm_resource_group" "sql_rg" {
  name     = local.sql_resource_group
  location = var.LOCATION
  tags     = local.tags
}
