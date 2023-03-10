module "cw-streamlog"{
    source = "../../../../../modules/cloudwatch/logstream"
    name = local.cloudwatch.streamlog.name
    log_group_name = local.cloudwatch.loggroup.name
}