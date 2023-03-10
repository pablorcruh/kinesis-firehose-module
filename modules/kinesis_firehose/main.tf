resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = var.name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn        = var.firehose_role_arn
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
        role_arn      = var.firehose_role_arn
      }
    }
  }
}