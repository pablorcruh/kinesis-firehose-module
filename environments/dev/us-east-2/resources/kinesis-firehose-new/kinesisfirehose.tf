module "firehose" {
  source            = "../../../../../modules/kinesis_firehose"
  name              = "test"
  catalogtable_name = module.glue_catalog_table.glue_table_name
  database_name     = module.glue_catalog_table.glue_database_name
  buffer_size       = 128
  buffer_interval   = 60
  bucket_arn        = module.s3_bucket.bucket_name_arn
  loggroup_name     = module.cw-streamlog.cloudwatch_loggroup_name
  streamlog_name    = module.cw-streamlog.cloudwatch_logstream_name
  deliveryStream_name = local.firehose.deliveryStream_name
}