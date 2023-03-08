variable "name" {
  description = "The name of the policy"
  type        = string
}
variable "description" {
  description = "The description of the policy"
  type        = string
}

variable "allowed_services" {
  description = "List of services to allow Get/List/Describe/View/... options"
  type        = list(string)
}
variable "region" {}
variable "resources" {
  type = list(string)
}
variable "sid" {}
variable "tags" {}
