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
      nicname       = "${b.vmnumber}-${b.id}-${var.location}-${c}"
      subnetname    = d.subnetname
      vnetname      = b.vnetname
      rgname        = b.rgname
      vmrg = try(var.rgname1[b.rgvalue].name, data.azurerm_resource_group.rg[b.existingrg].name)
      location = local.location


    }]




  ])

  vm = flatten([for a, b in var.vm :
    {

      vmname        = "${b.vmnumber}-${b.id}-${local.location}-v"
      size          = try(b.vmsize, "Standard_F2")
      location = local.location
      adminusername = try(b.adminusername, "vmadmin")
      adminpassword = try(b.adminpassword, "Unilever@123")
      osdiskcaching = try(b.os_disk.caching, "ReadWrite")
      osdiskstorage = try(b.os_disk.storage_account_type, "StandardSSD_LRS")
      # publisher     = try(b.source_image_reference.publisher, "MicrosoftWindowsServer")
      # offer         = try(b.source_image_reference.offer, "WindowsServer")
      # sku           = try(b.source_image_reference.sku, "2016-datacenter-gensecond")
      # version       = try(b.source_image_reference.version, "latest")
      sourceimage = try(b.source_image_reference, null)

      vmrg = try(var.rgname1[b.rgvalue].name, data.azurerm_resource_group.rg[b.existingrg].name)

      # the value for resource group , here var.rg1's answer is given in the root module where it is the output from
      # the module resource group..


      networkint = [for c, d in b.networking_interfaces : azurerm_network_interface.nic["${b.vmnumber}-${b.id}-${local.location}-${c}"].id]

  }])

  location = var.location



}







