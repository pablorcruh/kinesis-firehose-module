module "access-glue-pl" {
  source = "../../../../../modules/iam/policy/without-condition"
  name             = "kr-${local.policy.glue.name}"
  description      = "Policy access to Glue"
  allowed_services = local.policy.glue.allowed_services
  region           = var.region
  resources        = ["*"]
  sid              = "test"
  tags             = {}
}