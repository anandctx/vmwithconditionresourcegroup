


# This block calls the existing data RG when there is a reference for an existing RG for any VM in the 
# tfvars, if there is no call for data block, this is nullified
# also the key will produce a unique value by combining the existingrgname and vmnumber

data "azurerm_resource_group" "rg1" {
  for_each = {

    for a in local.rgtriple : a.rgshort => a

  }
  name = each.value.rg_name
}