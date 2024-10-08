# terraform.tfvars

subscription_id    = "029536b6-f6c6-4f73-af5f-565d7c4cc579"
resource_group_name = "RGEU-DEV-AUT03"
location           = "North Europe"
vnet_name          = "VNET-DEV-EU-002"
subnet_name        = "SNET-DEV-EU-MID-001"
vnet_resource_group = "RG-DEV-EU-STAGING-001"
number_of_vms      = 2
vm_size            = "Standard_D8as_v5"
os_disk_size       = 127
os_version         = "2022"

vm_details = [
  {
    vm_name       = "AZEU-DEV-AUT05"
    nic_name      = "AZEU-DEV-AUT05-NIC"
    ipconfig_name = "AZEU-DEV-AUT05-IPConfig"
    os_disk_name  = "AZEU-DEV-AUT05-OsDisk"
  }
]
