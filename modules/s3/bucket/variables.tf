variable "bucket" {
  description = "The name of the bucket"
}
variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed"
  default     = false
}
variable "bucket_acl" {
  description = "The ACL to apply to the bucket"
  default     = "private"
}
variable "bucket_status" {
  description = "The versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled"
  default     = "Disabled"
}
variable "bucket_block_public_acls" {
  default     = true
  description = "Whether Amazon S3 should block public ACLs for this bucket"
}
variable "bucket_block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  default     = true
}
variable "bucket_ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
  default     = true
}
variable "bucket_restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  default     = true
}
variable "bucket_prefix" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = null
}
variable "object_lock_enabled" {
  description = "Whether S3 bucket should have an Object Lock configuration enabled."
  type        = bool
  default     = false
}
variable "tags" {}
# variable "attach_policy" {
#   description = "Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy)"
#   type        = bool
#   default     = false
# }
variable "sid_s3" {}
variable "type_s3" {}
variable "identifiers_s3" {}
variable "effect_s3" {}
variable "actions_s3" {}
variable "path_s3" {
  default = "*"
}
