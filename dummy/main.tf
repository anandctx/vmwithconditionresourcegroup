



locals {
  a = { for a, b in var.name : a => b }
}


output "output" {
  value = local.a
}


variable "name" {




}