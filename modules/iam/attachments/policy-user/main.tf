#Atach policy
resource "aws_iam_user_policy_attachment" "this" {
  user       = var.users
  policy_arn = var.policy_arn
}
