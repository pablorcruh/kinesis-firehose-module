module "s3_bucket" {
  source         = "../../../../../modules/s3/bucket-simple"
  bucket         = "kr-${local.s3-simple.bucket.bucket_name}" 
  tags = {}
}