locals {
  sql_subnet_name    = "sqlsubnetname"
  sql_nsg_name       = "sqlnsgname"
  sql_resource_group = "sqlresourcegroup"
  sql_server_name    = "sqlservername"
  admin_user         = "admin"
  computer_name_sql  = "SQLVM01"
}

######### SQL SERVER ############

# Create Availibility Set for SQL Server
resource "azurerm_availability_set" "azurerm_avset_sql" {
  name                         = "SQL-AVSET"
  location                     = azurerm_resource_group.sql_rg.location
  resource_group_name          = azurerm_resource_group.sql_rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  tags = local.tags
}

# Create VMs for SQL server
module "windows_server_vm_sql" {
  count = 1

  source                           = "./vm_sql"
  resource_group_name              = azurerm_resource_group.sql_rg.name
  location                         = azurerm_resource_group.sql_rg.location
  vm_subnet_id                     = azurerm_subnet.sql.id
  vm_name                          = local.sql_server_name
  computer_name                    = local.computer_name_sql
  vm_size                          = var.VM_SIZE_SQL
  publisher                        = var.PUBLISHER_SQL
  offer                            = var.OFFER_SQL
  sku                              = var.SKU_SQL
  image_version                    = var.IMAGE_VERSION_SQL
  static_ip_address                = cidrhost(var.SQL_SUBNET_ADDRESS, "${count.index + 4}") #First 3 addresses are/could be reserved by Azure
  activity_tag                     = var.ACTIVITY_TAG
  admin_username                   = local.admin_user
  admin_password                   = var.ADMIN_PASSWORD
  vm_os_disk_delete_flag           = var.VM_OS_DISK_DELETE_FLAG
  vm_data_disk_delete_flag         = var.VM_DATA_DISK_DELETE_FLAG
  availability_set_id              = azurerm_availability_set.azurerm_avset_sql.id
  storage_uri                      = azurerm_storage_account.logstorage.primary_blob_endpoint
  workspaceId                      = azurerm_log_analytics_workspace.law.workspace_id
  workspaceKey                     = azurerm_log_analytics_workspace.law.primary_shared_key
  sql_connectivity_update_password = var.SQLADMINPWD
  sql_connectivity_update_username = var.SQLADMIN
  default_file_path_data           = "${var.SQLDATAFILEPATH}"
  default_file_path_log            = "${var.SQLLOGFILEPATH}"

  tags = local.tags
}
