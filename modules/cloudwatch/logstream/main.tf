resource "aws_cloudwatch_log_group" "this" {
  name = "/kr/kinesisfirehose/${var.name}"
}

resource "aws_cloudwatch_log_stream" "this" {
  name           = var.name
  log_group_name = aws_cloudwatch_log_group.this.name
}