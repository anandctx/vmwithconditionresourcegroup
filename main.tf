module "vm" {

  for_each = var.virtual_machines
  source   = "./vmmodule"
  location = each.key
  vm       = each.value
  # rg = module.rg["uksouth"].rgout
  rgname1 = module.rg[each.key].rgout




}

module "rg" {
  for_each = var.resgrp
  source   = "./rgmodule"
  rg       = each.value
  location = each.key

}

output "out_1" {
  value = module.vm["uksouth"].out_1
}

output "out_2" {
  value = module.vm["uksouth"].nicname
}

