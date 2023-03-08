resource "aws_glue_crawler" "this" {
  database_name = var.databasename
  name          = var.name
  role          = var.role_arn

  catalog_target {
    database_name = var.databasename
    tables        = [var.tablename]
  }

  schema_change_policy {
    delete_behavior = "LOG"
  }

  configuration = <<EOF
{
  "Version":1.0,
  "Grouping": {
    "TableGroupingPolicy": "CombineCompatibleSchemas"
  }
}
EOF
}