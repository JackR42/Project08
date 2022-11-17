# Configure storage accounts
# Storage for VM Boot diagnostics
resource "azurerm_storage_account" "logstorage" {
  name                      = lower("{var.ENVTYPE}${var.LOCATION}sqlsa")
  location                  = var.LOCATION
  resource_group_name       = azurerm_resource_group.app_rg.name
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Cool"
  enable_https_traffic_only = "true"

  tags = local.tags
}
