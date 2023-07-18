locals {
 
  rg14 = flatten([for a, b in var.rg :
    {
      name = try(b.name, null)
      key  = a
      # location = local.location
      # id = azurerm_resource_group.rg[a].id
      # id = "/subscriptions/6e54aa79-9b0b-40ed-ae27-91fdffa0a565/resourceGroups/${b.name}"
    }
  ])
  rg15 = { for a in local.rg14 : a.key => a }
  rg16 = flatten([for a, b in var.rg :
    {
      name = try(b.name, null)
      key  = a
      # location = local.location
      id = azurerm_resource_group.rg[a].id
      
    }
  ])

 
}




 