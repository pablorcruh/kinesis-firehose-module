module "glue-pl-attachment" {
  source     = "../../../../../modules/iam/attachments/policy-role"
  name_pl    = module.access-glue-pl.name_policy_create
  role_name  = [module.glue-access-role.role_name]
  policy_arn = module.access-glue-pl.arn_policy_create
}