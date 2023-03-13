module "glue_crawler" {
  source       = "../../../../../modules/glue/crawler"
  databasename = module.glue_catalog_table.glue_database_name
  name         = "test"
  tablename    = module.glue_catalog_table.glue_table_name 
}