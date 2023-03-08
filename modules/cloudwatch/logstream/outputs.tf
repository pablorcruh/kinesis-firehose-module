output "cloudwatch_logstream_name" {
    value = aws_cloudwatch_log_stream.this.*.name
}

output "cloudwatch_logstream_arn" {
    value = aws_cloudwatch_log_stream.this.*.arn
}
