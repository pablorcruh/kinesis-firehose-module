resource "aws_iam_policy" "this_condition" {
  name        = var.name
  path        = local.path
  description = var.description
  policy      = data.aws_iam_policy_document.policy_document_condition.json
  tags        = var.tags
}
data "aws_iam_policy_document" "policy_document_condition" {

  statement {

    sid       = var.sid
    effect    = "Allow"
    actions   = local.allowed_services
    resources = var.resources
    condition {
      test     = var.test
      variable = var.variable
      values   = [var.values]
    }
  }
}
