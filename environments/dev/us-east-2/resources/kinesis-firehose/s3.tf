module "s3_bucket" {
  source         = "../../../../../modules/s3/bucket"
  bucket         = "kr-${local.s3.bucket.bucket_name}"
  effect_s3      = local.s3.bucket.effect_s3
  type_s3        = "*"
  identifiers_s3 = "*"
  actions_s3     = "s3:GetObject"
  sid_s3         = local.s3.bucket.sid_s3
  tags           =  {}     
}