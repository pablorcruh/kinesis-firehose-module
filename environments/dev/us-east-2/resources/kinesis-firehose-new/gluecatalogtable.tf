module "glue_catalog_table" {
  source            = "../../../../../modules/glue/catalog_table"
  catalog_tablename = local.glue.catalog_tablename
  databasename      = local.glue.catalog_database_name
  name              = local.glue.catalog_database_name
}