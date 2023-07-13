output "rgout" {
  value = { for a in local.rg : a.key => a }
  # value = { for a in local.rg : a.key => a if a.name !=null   }
}