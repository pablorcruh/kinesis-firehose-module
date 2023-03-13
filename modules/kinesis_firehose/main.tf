resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = var.name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn        = aws_iam_role.this.arn
    buffer_size     = var.buffer_size
    buffer_interval = var.buffer_interval
    bucket_arn      = var.bucket_arn

    dynamic_partitioning_configuration {
      enabled = "true"
    }

    # Example prefix using partitionKeyFromQuery, applicable to JQ processor
    prefix              = "data/enterprise_id=!{partitionKeyFromQuery:enterprise_id}/year=!{timestamp:yyyy}/month=!{timestamp:MM}/day=!{timestamp:dd}/hour=!{timestamp:HH}/"
    error_output_prefix = "errors/year=!{timestamp:yyyy}/month=!{timestamp:MM}/day=!{timestamp:dd}/hour=!{timestamp:HH}/!{firehose:error-output-type}/"


    processing_configuration {
      enabled = "true"

      processors {
        type = "MetadataExtraction"
        parameters {
          parameter_name  = "JsonParsingEngine"
          parameter_value = "JQ-1.6"
        }
        parameters {
          parameter_name  = "MetadataExtractionQuery"
          parameter_value = "{enterprise_id:.\"owner.enterprise.id\"}"
        }
      }

    }

    cloudwatch_logging_options {
      enabled         = var.enable_logs
      log_group_name  = var.loggroup_name
      log_stream_name = var.streamlog_name
    }

    data_format_conversion_configuration {
      input_format_configuration {
        deserializer {
          hive_json_ser_de {}
        }
      }

      output_format_configuration {
        serializer {
          parquet_ser_de {}
        }
      }

      schema_configuration {
        database_name = var.database_name
        table_name    = var.catalogtable_name
        role_arn      = aws_iam_role.this.arn
      }
    }
  }
}

resource "aws_iam_role" "this" {
  name = var.deliveryStream_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "this" {
  name   = "kinesis_firehose_access_glue_policy"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.kinesis_firehose_access_glue_assume_policy.json
}

data "aws_iam_policy_document" "kinesis_firehose_access_glue_assume_policy" {
  statement {
    effect    = "Allow"
    actions   = ["glue:GetTableVersions"]
    resources = ["*"]
  }
}