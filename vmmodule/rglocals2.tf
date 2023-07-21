

#this block is used to define the local for the existing RG 
locals {
   rgtriple = distinct(flatten([for a, b in var.vm :
    {
      rg_key  = b.rg_key
      rg_name = var.rgname1[b.rgvalue].name
      rgshort = b.rgvalue
    }
  ]))
}

