output "out_1" {
  value = { for a in local.nic : a.nicname => a }
}

output "nicname" {
  value = { for a in local.vm : a.vmname => a }
}

output "rgout2" {
  value = { for a in local.rgexist : a.key => a if a.name != null }
}