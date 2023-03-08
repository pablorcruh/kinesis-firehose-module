resource "aws_iam_role_policy" "this" {
  name        = var.name
  path        = local.path
  description = var.description
  policy      = data.aws_iam_role_policy_document.role_policy_document.json
  tags        = var.tags
}

data "aws_iam_role_policy_document" "role_policy_document" {
  statement {
    sid      = var.sid
    effect   = "Allow"
    actions  = local.allowed_services
    resource = var.resources
  }
}