resource "aws_kms_key" "this" {
  description = var.kms_description
  tags        = var.tags
}
resource "aws_kms_alias" "this" {
  name          = var.kms_name
  target_key_id = aws_kms_key.this.key_id
}
