data "azurerm_resource_group" "rg" {
  # for_each = { for a in local.rgexist : a.key => a if a.name != null }

  for_each = { for a in local.rgexist : "${a.name}-${a.vmnumb}" => a if a.name != null }
  name     = each.value.name
}


# This block calls the existing data RG when there is a reference for an existing RG for any VM in the 
# tfvars, if there is no call for data block, this is nullified
# also the key will produce a unique value by combining the existingrgname and vmnumber