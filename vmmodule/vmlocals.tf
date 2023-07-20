locals {


  nic = flatten([for a, b in var.vm : [for c, d in b.networking_interfaces :
    {

      vmname        = "${b.vmnumber}-${b.id}-${local.location}-vm"
      size          = try(b.vmsize, "Standard_F2")
      adminusername = try(b.adminusername, "vmadmin")
      adminpassword = try(b.adminpassword, "Unilever@123")
      osdiskcaching = try(b.os_disk.caching, "ReadWrite")
      osdiskstorage = try(b.os_disk.storage_account_type, "StandardSSD_LRS")
      publisher     = try(b.source_image_reference.publisher, "MicrosoftWindowsServer")
      offer         = try(b.source_image_reference.offer, "WindowsServer")
      sku           = try(b.source_image_reference.sku, "2019-datacenter-gensecond")
      version       = try(b.source_image_reference.version, "latest")
      nicname       = "${b.vmnumber}-${b.id}-${module.location.locshort}-${c}"
      subnetname    = d.subnetname
      vnetname      = b.vnetname
      rgname        = b.rgname
      # vmrg          = try(var.rgname1[b.rgvalue].name, data.azurerm_resource_group.rg[b.existingrg].name)
      vmrg = try(var.rgname1[b.rgvalue].name, null) == null ? var.rgname2[b.rgvalue].name : var.rgname1[b.rgvalue].name
      # vmdatarg = try(var.rgname1[b.rgvalue].existingrg, null)
      location = local.location
      parentid = try(var.rgname1[b.rgvalue].id, null) == null ? var.rgname2[b.rgvalue].id : var.rgname1[b.rgvalue].id


    }]




  ])

  vm = flatten([for a, b in var.vm :
    {

      vmname        = "${b.vmnumber}${b.id}${module.location.locshort}v"
      size          = try(b.vmsize, "Standard_F2")
      location      = local.location
      adminusername = try(b.adminusername, "vmadmin")
      adminpassword = try(b.adminpassword, "Unilever@123")
      osdiskcaching = try(b.os_disk.caching, "ReadWrite")
      osdiskstorage = try(b.os_disk.storage_account_type, "StandardSSD_LRS")
      # publisher     = try(b.source_image_reference.publisher, "MicrosoftWindowsServer")
      # offer         = try(b.source_image_reference.offer, "WindowsServer")
      # sku           = try(b.source_image_reference.sku, "2016-datacenter-gensecond")
      # version       = try(b.source_image_reference.version, "latest")
      sourceimage = try(b.source_image_reference, null)
      zone        = try(b.zone, null)

      # vmrg = try(var.rgname1[b.rgvalue].name, data.azurerm_resource_group.rg[b.existingrg].name)

      vmrg = try(var.rgname1[b.rgvalue].name, null) == null ? var.rgname2[b.rgvalue].name : var.rgname1[b.rgvalue].name

      # the value for resource group , here var.rg1's answer is given in the root module where it is the output from
      # the module resource group..


      networkint = [for c, d in b.networking_interfaces : azurerm_network_interface.nic["${b.vmnumber}-${b.id}-${module.location.locshort}-${c}"].id]

  }])

  location = var.location



}

# this block is written in such a way that the based on the value given in tfvars, it tries to map
# the resource gorup to data block existing rg or it maps to the new resource group







