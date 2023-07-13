output "resource_groups" {
  description = "The list of resource groups created by the module"
  value       = module.rg["uksouth"]
}