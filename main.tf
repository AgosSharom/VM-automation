# main.tf

# Provider configuration
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Data block to get existing Virtual Network
data "azurerm_virtual_network" "existing_vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group
}

# Data block to get existing Subnet
data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = var.vnet_resource_group
}

# Create network interfaces for each VM
resource "azurerm_network_interface" "vm_nic" {
  count               = length(var.vm_details)
  name                = var.vm_details[count.index].nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.vm_details[count.index].ipconfig_name
    subnet_id                     = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create VMs for each VM in vm_details
resource "azurerm_windows_virtual_machine" "vm" {
  count               = length(var.vm_details)
  name                = var.vm_details[count.index].vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = "adminuser"
  admin_password      = "Password123!"

  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]

  os_disk {
    name              = var.vm_details[count.index].os_disk_name
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb      = var.os_disk_size
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
