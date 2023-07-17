module "vm" {

  for_each = var.virtual_machines
  source   = "./vmmodule"
  location = each.key
  vm       = each.value
  # rg = module.rg["uksouth"].rgout
  rgname1 = try (module.rg[each.key].rgout, null)
  rgname2 = module.rg[each.key].rg4
 

 

  }

# this line modified to null if there is no new resource group)




module "rg" {
  for_each = var.resgrp
  source   = "./rgmodule"
  rg       = each.value
  location = each.key
  # rterrgid = azurerm

}

# module "location" {
#   source = "./location"
#   location = var.location
# desc = this module shold not be caled here as it is expecting the value for var.location
# }





