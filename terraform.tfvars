virtual_machines = {

  uksouth = {
    iamvm01 = {

      id       = "t"
      vmnumber = "01"
      vmsize   = "Standard_B1s"
      rg_key   = "rg01"
      os_type  = "windows"
      # rgvalue  = "rg01"
      existingrg ="ibo-rg"

      os_disk = {
        disk_size_gb         = 40
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "MicrosoftWindowsServer"
        offer     = "windowsserver"
        sku       = "2016-Datacenter-gensecond"
        version   = "14393.6085.230705"
      }


      rgname   = "ibo-rg"
      vnetname = "ibo-01-vnet"

      networking_interfaces = {
        nic01 = {
          subnetname = "ibo-01-subnet"
          #dns_servers = []
        }

        # nic02 = {
        #   subnetname = "ibo-01-subnet"
        #   #dns_servers = []
        # }



      }
    }
    iamvm02 = {

      id       = "t"
      vmnumber = "02"
      vmsize   = "Standard_B1s"
      rg_key   = "rg02"
      os_type  = "windows"
      rgvalue  = "rg01"
      # existingrg = "ibo-rg"

      os_disk = {
        disk_size_gb         = 40
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "MicrosoftWindowsServer"
        offer     = "windowsserver"
        sku       = "2016-Datacenter-gensecond"
        version   = "14393.6085.230705"
      }


      rgname   = "ibo-rg"
      vnetname = "ibo-01-vnet"

      networking_interfaces = {
        nic01 = {
          subnetname = "ibo-01-subnet"
          #dns_servers = []
        }

        # nic02 = {
        #   subnetname = "ibo-01-subnet"
        #   #dns_servers = []
        # }



      }
    }
    iamvm03 = {

      id       = "t"
      vmnumber = "03"
      vmsize   = "Standard_B1s"
      rg_key   = "rg01"
      os_type  = "windows"
        rgvalue  = "rg02"
      # existingrg = "ibo-rg1"
      # zone = "1"

      os_disk = {
        disk_size_gb         = 40
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }

      source_image_reference = {
        publisher = "MicrosoftWindowsServer"
        offer     = "windowsserver"
        sku       = "2016-Datacenter-gensecond"
        version   = "14393.6085.230705"
      }


      rgname   = "ibo-rg"
      vnetname = "ibo-01-vnet"

      networking_interfaces = {
        nic01 = {
          subnetname = "ibo-01-subnet"
          #dns_servers = []
        }

        # nic02 = {
        #   subnetname = "ibo-01-subnet"
        #   #dns_servers = []
        # }



      }
    }
  }
  # germanywestcentral = {
  #   iamvm01 = {

  #     id       = "t"
  #     vmnumber = "01"
  #     vmsize   = "Standard_B1s"
  #     rg_key   = "rg01"
  #     os_type  = "windows"
  #     # rgvalue  = "rg01"
  #       existingrg ="ibo-gwc-vnet"
  #       zone = "3"

  #     os_disk = {
  #       disk_size_gb         = 40
  #       caching              = "ReadWrite"
  #       storage_account_type = "Standard_LRS"
  #     }

  #     source_image_reference = {
  #       publisher = "MicrosoftWindowsServer"
  #       offer     = "windowsserver"
  #       sku       = "2016-Datacenter-gensecond"
  #       version   = "14393.6085.230705"
  #     }


  #     rgname   = "ibo-gwc-vnet"
  #     vnetname = "ibo-gwc-vnet"

  #     networking_interfaces = {
  #       nic01 = {
  #         subnetname = "ibo-gwc-subnet"
  #         #dns_servers = []
  #       }

  #       # nic02 = {
  #       #   subnetname = "ibo-01-subnet"
  #       #   #dns_servers = []
  #       # }



  #     }
  #   }
  # }
}

resgrp = {

  uksouth = {
    rg01 = {
      name = "computeint-01"
    }
    rg02 = {
      name = "computeinteger-01"
    }
    # rg03 = {
    #   name = "computeext-01"
    # }
  }
  # germanywestcentral = {
  #   rg01 = {
  #     name = "computeint-gwc-01"
  #   }
  # }
  # eastus2 = {
  #   rg01 = {
  #     name = "computeint-eastus2-01"
  #   }
}
