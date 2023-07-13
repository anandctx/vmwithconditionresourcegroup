locals {
  rg = flatten([for a, b in var.rg :
    {
      name = b.name
      key  = a
    }
  ])
}

 