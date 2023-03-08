variable "actions" {
  description = "List of services to allow Get/List/Describe/View/... options"
}
variable "type" {}
variable "trusted_entities_services" {
  description = "List of additional trusted entities for assumed role  (trust relationship)"
  type        = any
  default     = []
}
variable "assume_role_policy_statements" {
  description = "Map of dynamic policy statements for assuming role (trust relationship)"
  type        = any
  default     = {}
}
variable "role_name" {
  description = "Name of IAM role to use for Lambda Function"
  type        = string
  default     = null
}
variable "role_description" {
  description = "Description of IAM role to use"
  type        = string
  default     = null
}
variable "role_force_detach_policies" {
  description = "Specifies to force detaching any policies the IAM role has before destroying it."
  type        = bool
  default     = true
}
variable "role_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the IAM role used by Lambda Function"
  type        = string
  default     = null
}
variable "sid" {}
variable "tags" {}
