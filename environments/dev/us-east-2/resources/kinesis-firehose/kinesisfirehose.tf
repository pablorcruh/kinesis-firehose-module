module "firehose" {
  source            = "../../../../../modules/cloudwatch/kinesis_firehose"
  name              = ""
  firehose_role_arn = ""
  buffer_size       = ""
  buffer_interval   = ""
  bucket_arn        = ""
  loggroup_name     = ""
  streamlog_name    = ""
  database_name     = ""
  catalogtable_name = ""
}