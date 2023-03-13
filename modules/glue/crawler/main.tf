resource "aws_glue_crawler" "this" {
  database_name = var.databasename
  name          = var.name
  role          = aws_iam_role.this.arn

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

resource "aws_iam_role" "this" {
  name               = "AWSGlueServiceRoleDefault"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# GLUE POLICY
data "aws_iam_policy_document" "this" {
  statement {
    effect    = "Allow"
    actions   = ["glue:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "access_glue_policy"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.this.json
}