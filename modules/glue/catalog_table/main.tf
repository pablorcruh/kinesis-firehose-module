resource "aws_glue_catalog_table" "this" {
  name          = var.catalog_tablename
  database_name = var.databasename

  parameters = {
    "classification" = "parquet"
  }

  partition_keys {
    name    = "owner.enterprise.id"
    type    = "string"
    comment = ""
  }

  storage_descriptor {
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    location      = "s3://${aws_s3_bucket.kinesis_firehose_stream_bucket.bucket}/"

    ser_de_info {
      name                  = "JsonSerDe"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
        "explicit.null"        = false
        "parquet.compression"  = "SNAPPY"
      }
    }

    # TABLE SCHEMA
    columns {
      name    = "classifier.type"
      type    = "string"
      comment = "classifier details"
    }
    columns {
      name    = "classifier.version"
      type    = "string"
      comment = "classifier details"
    }
    columns {
      name    = "owner.enterprise.name"
      type    = "string"
      comment = "enterprise details"
    }
    columns {
      name    = "owner.agent.type"
      type    = "string"
      comment = "agent details"
    }
    columns {
      name    = "owner.user.id"
      type    = "string"
      comment = "station details"
    }
    columns {
      name    = "owner.user.name"
      type    = "string"
      comment = "station details"
    }
    columns {
      name    = "owner.user.name_short"
      type    = "string"
      comment = "station details"
    }
    columns {
      name    = "owner.area.id"
      type    = "string"
      comment = "area details"
    }
    columns {
      name    = "owner.area.name"
      type    = "string"
      comment = "area details"
    }
    columns {
      name    = "owner.area.name_short"
      type    = "string"
      comment = "area details"
    }
    columns {
      name    = "document.name"
      type    = "string"
      comment = "document details"
    }
    columns {
      name    = "document.path"
      type    = "string"
      comment = "document details"
    }
    columns {
      name    = "document.format"
      type    = "string"
      comment = "document details"
    }
    columns {
      name    = "document.modification_date"
      type    = "string"
      comment = "document details"
    }
    columns {
      name    = "document.metadata"
      type    = "string"
      comment = "document details"
    }
    columns {
      name    = "analysis.date_analysis"
      type    = "string"
      comment = "analysis details"
    }
    columns {
      name    = "analysis.classification.number"
      type    = "int"
      comment = "analysis details"
    }
    columns {
      name    = "analysis.classification.name"
      type    = "string"
      comment = "analysis details"
    }
    columns {
      name    = "analysis.personal_data"
      type    = "boolean"
      comment = "analysis details"
    }
    columns {
      name    = "analysis.credit_card"
      type    = "boolean"
      comment = "analysis details"
    }
    columns {
      name    = "analysis.ml_version"
      type    = "int"
      comment = "analysis details"
    }
    columns {
      name    = "analysis.metadata"
      type    = "string"
      comment = "analysis details"
    }
  }
}

