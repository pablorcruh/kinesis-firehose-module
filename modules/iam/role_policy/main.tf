data "aws_iam_policy_document" "trusted_entities" {
  statement {
    effect  = "Allow"
    actions = var.actions
    sid     = var.sid

    principals {
      type        = var.type
      identifiers = var.trusted_entities_services
    }
  }
}

resource "aws_iam_role_policy" "this" {
  name        = var.name
  role        = var.role_name
  policy      = data.aws_iam_policy_document.trusted_entities.json
}

