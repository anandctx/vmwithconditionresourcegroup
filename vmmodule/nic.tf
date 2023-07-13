resource "azurerm_network_interface" "nic" {
  for_each            = { for a in local.nic : a.nicname => a }
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.vmrg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}