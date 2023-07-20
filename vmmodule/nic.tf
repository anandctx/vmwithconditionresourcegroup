resource "azurerm_network_interface" "nic" {
  for_each            = { for a in local.nic : a.nicname => a }
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = try (each.value.vmrg, each.value.vmdatarg)

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    # private_ip_address = "${azurerm_network_interface.nic[each.key].private_ip_addresses[0]}"

  }

  lifecycle {

    create_before_destroy = true
    ignore_changes = [

      ip_configuration[0].private_ip_address_allocation

    ]

  }
}