#Atach policy
resource "aws_iam_policy_attachment" "this" {
  name       = var.name_pl
  roles      = var.role_name
  policy_arn = var.policy_arn
}
