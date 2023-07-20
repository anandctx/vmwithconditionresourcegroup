 locals {
    
    abcdrg = flatten([

    for a, b in var.rg : {

      key      = a
      name     = try (format("%s-%s", "abc", b.name), null)
      key2 = try (b.name, null)
      id = try("/subscriptions/6e54aa79-9b0b-40ed-ae27-91fdffa0a565/resourceGroups/${format("%s-%s", "abc", b.name)}", null)
     

    }

  ])

 }