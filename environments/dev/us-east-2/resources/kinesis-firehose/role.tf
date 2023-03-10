module "glue-access-role"{
    source = "../../../../../modules/iam/role"
    role_name                 = local.role.role_glue_kn.role_name
    sid                       = local.role.role_glue_kn.sid
    actions                   = local.role.role_glue_kn.actions
    type                      = local.role.role_glue_kn.type
    trusted_entities_services = local.role.role_glue_kn.identifiers
    tags = {}  
}