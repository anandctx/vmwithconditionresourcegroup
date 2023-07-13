output "resource_groups" {
  description = "The list of resource groups created by the module"
  value       = module.rg["uksouth"]
}

output "out_1" {
  value = module.vm["uksouth"].out_1
}

output "out_2" {
  value = module.vm["uksouth"].nicname
}

# output "location" { this wont show in root module
# because the value of variable is defined only within the child modules
#   value = module.location.locshort
# }


