resource "azurerm_resource_group" "rg" {

  for_each = { for a in local.abcdrg: a.key => a if a.name != null }
  name     = each.value.name
  location = var.location
}


#this block has been modified to kick in only when the resource group is defined in tfvars