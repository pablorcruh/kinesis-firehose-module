module "cw-loggroup" {
    source = "../../../../../modules/cloudwatch/loggroup"
    name = local.cloudwatch.loggroup.name
}