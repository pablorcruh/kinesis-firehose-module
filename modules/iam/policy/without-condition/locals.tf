locals {
  allowed_services = distinct(var.allowed_services)
  path             = "/"

}
