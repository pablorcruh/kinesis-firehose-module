resource "aws_s3_bucket" "this" {
  bucket              = var.bucket
  bucket_prefix       = var.bucket_prefix
  object_lock_enabled = var.object_lock_enabled
  force_destroy       = var.force_destroy
  tags                = var.tags
}
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.bucket_acl
}
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.bucket_status
  }
}
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.bucket_block_public_acls
  block_public_policy     = var.bucket_block_public_policy
  ignore_public_acls      = var.bucket_ignore_public_acls
  restrict_public_buckets = var.bucket_restrict_public_buckets
}
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}
data "aws_iam_policy_document" "this" {

  statement {
    sid = var.sid_s3

    principals {
      type        = var.type_s3
      identifiers = [var.identifiers_s3]
    }

    effect = var.effect_s3

    actions = [
      var.actions_s3,
    ]
    resources = ["${aws_s3_bucket.this.arn}/${var.path_s3}"]
  }
}
