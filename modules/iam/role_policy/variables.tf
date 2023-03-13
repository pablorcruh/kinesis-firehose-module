variable "name" {
  description = "The name of the policy"
  type        = string
}

variable "role_name" {
  description = "The role name"
  type        = string
}

variable "trusted_entities_services" {
  description = "List of additional trusted entities for assumed role  (trust relationship)"
  type        = any
  default     = []
}

variable "actions" {
  description = "List of services to allow Get/List/Describe/View/... options"
}

variable "allowed_services" {
  description = "List of services to allow Get/List/Describe/View/... options"
  type        = list(string)
}

variable "resources" {
  type = list(string)
}
variable "sid" {}
variable "tags" {}
variable "type" {}
