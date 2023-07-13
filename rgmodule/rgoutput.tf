output "rgout" {
  value = { for a in local.rg : a.key => a }
}