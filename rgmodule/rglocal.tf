locals {
  rg = flatten([for a, b in var.rg :
    {
      name     = try(b.name, null)
      key      = a
      location = local.location
      # id = azurerm_resource_group.rg[a].id
    }
  ])
  location = var.location
  rg14 = flatten([for a, b in var.rg :
    {
      name     = try(b.name, null)
      key      = a
      # location = local.location
      # id = azurerm_resource_group.rg[a].id
      # id = "/subscriptions/6e54aa79-9b0b-40ed-ae27-91fdffa0a565/resourceGroups/${b.name}"
    }
  ])
  rg15 = { for a in local.rg14 : a.key => a }

  rg2 = { for a in local.rg : a.key => a }
  # rg3 = flatten([for a, b in local.rg2 :
  #   {
  #     name = try(b.name, null)
  #     key  = a
  #     id   = azurerm_resource_group.rg[a].id
  #   }
  # ])
  # rg4 = { for a in local.rg3 : a.key => a }

}


 