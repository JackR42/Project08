# https://faun.pub/using-terraform-to-configure-sql-server-on-azure-vm-7cdba2c1a3b3
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "rg" {
  name = "S1-${var.prefix}RG"
  location = var.location
}

resource "azurerm_windows_virtual_machine" "vm1" {    
    name    = "${var.prefix}VM1"
    location = rg.location
    resource_group_name = rg.name
    admin_username  = "admindba"
    admin_password  = "ABCabc123.42"

    source_image_reference {
        publisher = "MicrosoftSQLServer"
        offer     = "sql2022-ws2022"
        sku       = "enterprise"
        version   = "latest"
    }
        
#    os_disk {
#        name                    = "${element(var.instances, count.index)}-osdisk"
#        caching                 = "ReadWrite"
#        storage_account_type    = "StandardSSD_LRS"
#        disk_size_gb            = 250
#    }
}

resource "azurerm_mssql_virtual_machine" "sqlvm" {
    virtual_machine_id               = azurerm_windows_virtual_machine.vm1.id
    sql_license_type                 = "PAYG"
    r_services_enabled               = false
    sql_connectivity_port            = 1433
    sql_connectivity_type            = "PRIVATE"
    sql_connectivity_update_username = "admindba"
    sql_connectivity_update_password = "ABCabc123.42"

    }
}

