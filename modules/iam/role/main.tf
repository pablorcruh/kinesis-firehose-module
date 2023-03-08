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

resource "aws_iam_role" "this" {
  name                  = var.role_name
  description           = var.role_description
  path                  = local.role_path
  force_detach_policies = var.role_force_detach_policies
  permissions_boundary  = var.role_permissions_boundary
  assume_role_policy    = data.aws_iam_policy_document.trusted_entities.json
  tags                  = var.tags
}
