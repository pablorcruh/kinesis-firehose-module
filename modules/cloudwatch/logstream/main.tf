resource "aws_cloudwatch_log_stream" "this" {
  log_group_name = var.log_group_name
  name           = var.name
}