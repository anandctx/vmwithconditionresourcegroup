data "azurerm_subnet" "subnet" {
  for_each             = { for a in local.nic : a.nicname => a }
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname

}