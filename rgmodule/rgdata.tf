data "azurerm_resource_group" "rg" {
  # for_each = { for a in local.rgexist : a.key => a if a.name != null }

  for_each = { for a in local.datargver1 : a.key => a if a.name != null }
  name     = each.value.name
}