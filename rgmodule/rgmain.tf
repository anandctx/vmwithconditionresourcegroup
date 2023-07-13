resource "azurerm_resource_group" "rg" {

  for_each = { for a in local.rg : a.key => a if a.name != null }
  name     = each.value.name
  location = var.location
}