module "glue_catalog_database" {
  source      = "../../../../../modules/glue/catalog_database"
  name        = local.glue.catalog_database_name
  description = local.glue.catalog_database_description
  tags        = []
}