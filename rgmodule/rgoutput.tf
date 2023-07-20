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

output "newrg" {
  value = { for a in local.rg14 : a.key => a if a.name != null }
}
output "existrg" {
  value = { for a in local.datargver1 : a.key => a if a.name != null }
}

# output "existrg" {
#   value = { for a in var.rg: a.name => a if a.name!=null }
# }