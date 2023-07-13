locals {
  rg = flatten([for a, b in var.rg :
    {
      name = try (b.name,null)
      key  = a
    }
  ])
}

 