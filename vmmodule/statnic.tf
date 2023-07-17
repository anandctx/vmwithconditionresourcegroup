resource "azapi_update_resource" "nic_to_static" {

 for_each            = { for a in local.nic : a.nicname => a }
  name      =  each.value.nicname
  parent_id = each.value.parentid
  type      = "Microsoft.Network/networkInterfaces@2021-08-01"
  body = jsonencode({
    "properties" : {
      "ipConfigurations" : [
        {
          "name" : "internal",
          "properties" : {
            "privateIPAddress" : "${azurerm_network_interface.nic[each.key].private_ip_addresses[0]}",
            "privateIPAllocationMethod" : "Static",
            "subnet" : {
              "id" : data.azurerm_subnet.subnet[each.key].id
            }
          }
        }
      ]
    },
    "location" : local.location
  })

  depends_on = [

    azurerm_network_interface.nic

  ]

}