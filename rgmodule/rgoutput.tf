# output "rgout" {
#   value = { for a in local.rg : a.key => a }
#   # value = { for a in local.rg : a.key => a if a.name !=null   }
# }

# output "rgid" {
#   value = [for a in local.rg : azurerm_resource_group.rg[a.key].id]
# }


# output "newrgid" {
#   value = flatten([for a, b in local.rg2 :
#     {
#       name = try(b.name, null)
#       key  = a
#       id   = azurerm_resource_group.rg[a].id
#     }
#   ])
# }

# output "rg4" {
#   value = local.rg4
# }

output "rg15" {
  value = { for a in local.rg14 : a.key => a }
}

# output "rg16" {
#   value = { for a in local.rg16 : a.key => a }
# } If this is uncommented, there is an issue with the resource group where the vm does not 
# know the resource group as local.rg16 is having resource group id ... 
# also it creates an issue where already existing vm gets recreated when new vm is added to tfvars

# output "rgid001" {
#    value = [
#     for a in azurerm_resource_group.rg : {
#       name           = a.name
     
      
#       rgid    = a.id
#     }
#   ]
# }

output "rgid002" {
   value = {for a in azurerm_resource_group.rg : a.name => {
      name           = a.name
       rgid    = a.id
    }
}
}