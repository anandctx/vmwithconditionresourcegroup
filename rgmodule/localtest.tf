 locals {
    
    abcdrg = flatten([

    for a, b in var.rg : {

      key      = a
      name     = try (format("%s-%s", "abc", b.name), null)
      key2 = try (b.name, null)
      id = try("/subscriptions/${var.subid}/resourceGroups/${format("%s-%s", "abc", b.name)}", null)
     

    }

  ])

 }