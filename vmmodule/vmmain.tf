resource "azurerm_windows_virtual_machine" "vm" {
  for_each              = { for a in local.vm : a.vmname => a }
  name                  = each.value.vmname
  resource_group_name   = each.value.vmrg
  location              = local.location
  size                  = each.value.size
  admin_username        = each.value.adminusername
  admin_password        = each.value.adminpassword
  network_interface_ids = each.value.networkint
  zone                  = each.value.zone

  os_disk {
    caching              = each.value.osdiskcaching
    storage_account_type = each.value.osdiskstorage
  }

  # source_image_reference {
  #   publisher = each.value.publisher
  #   offer     = each.value.offer
  #   sku       = each.value.offer
  #   version   = each.value.version
  # }

  source_image_reference {

    publisher = try(each.value.sourceimage.publisher, "center-for-internet-security-inc")
    offer     = try(each.value.sourceimage.offer, "cis-windows-server-2022-l2")
    sku       = try(each.value.sourceimage.sku, "cis-windows-server-2022-l2-gen2")
    version   = try(each.value.sourceimage.version, "latest")
  }

  # lifecycle {
  #   ignore_changes = [ resource_group_name ]
  # }
}