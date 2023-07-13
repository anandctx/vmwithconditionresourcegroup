locals {
  rgexist = flatten([for a, b in var.vm :
    {
      name = try(b.existingrg, null)
      # key  = try(b.existingrg, null)
      # key  = try("${b.existingrg}-${b.vmnumber}", null)
      vmnumb = b.vmnumber
    }
  ])
}
