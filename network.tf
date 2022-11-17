# Pull existing VNET from Azure
data "azurerm_virtual_network" "vnet" {
  name                = var.VNET
  resource_group_name = var.NETWORK_RESOURCE_GROUP
}

# Create SQL Subnet
resource "azurerm_subnet" "sql" {
  name                 = local.sql_subnet_name
  resource_group_name  = data.azurerm_resource_group.rsg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = [var.SQL_SUBNET_ADDRESS]
}

# Create SQL NSG
resource "azurerm_network_security_group" "sql" {
  name                = local.sql_nsg_name
  location            = var.LOCATION
  resource_group_name = azurerm_resource_group.sql_rg.name

  tags = local.tags
}

# Associate SQL NSG with subnet
resource "azurerm_subnet_network_security_group_association" "sql" {
  subnet_id                 = azurerm_subnet.sql.id
  network_security_group_id = azurerm_network_security_group.sql.id

  depends_on = [
    azurerm_resource_group.sql_rg, azurerm_subnet.sql, azurerm_network_security_group.sql
  ]
}

# Add rules to SQL NSG
resource "azurerm_network_security_rule" "rdp_sql" {
  name                        = "Allow_RDP_VPN"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.0.0.0/24"]
  destination_address_prefix  = var.SQL_SUBNET_ADDRESS
  resource_group_name         = azurerm_resource_group.sql_rg.name
  network_security_group_name = azurerm_network_security_group.sql.name
}

resource "azurerm_network_security_rule" "sql" {
  name                        = "Allow_App_SQL"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefixes     = ["10.0.0.0/24"]
  destination_address_prefix  = var.SQL_SUBNET_ADDRESS
  resource_group_name         = azurerm_resource_group.sql_rg.name
  network_security_group_name = azurerm_network_security_group.sql.name
}

resource "azurerm_network_security_rule" "sql_deny_all" {
  name                        = "Deny_All_Inbound"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = var.SQL_SUBNET_ADDRESS
  resource_group_name         = azurerm_resource_group.sql_rg.name
  network_security_group_name = azurerm_network_security_group.sql.name
}
