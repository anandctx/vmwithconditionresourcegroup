resource "azurerm_resource_group" "rg" {

  for_each = { for a in local.rg : a.key => a if a.key != null }
  name     = each.value.name
  location = var.location
}


#this block has been modified to kick in only when the resource group is defined in tfvars