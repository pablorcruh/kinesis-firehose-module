locals {
  glue = {
    catalog_database_name        = "kr-glue-database"
    catalog_database_description = "kr-catalog-description"
    catalog_tablename            = "kr-catalog-tablename"
    name                         = "kr-name"
  }


  s3 = {
    bucket = {
      bucket_name    = "pablorcruh-test-bucket"
      effect_s3      = "Allow"
      sid_s3         = "AllowPublicAccess"
      identifiers_s3 = "*"
      type_s3        = "*"
      actions_s3     = "s3:*"
    }
  }

  s3-simple = {
    bucket = {
      bucket_name    = "pablorcruh-test-bucket"
    }
  }

  role = {
    role_policy_glue_kn = {
      name        = "kr-glue-name"
      role_name   = "kr-glue-role-policy"
      actions     = ["sts:AssumeRole"]
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
      sid         = "GlueAsesRoleSid"
      resources   = ["*"]
    }

    role_glue_kn = {
      role_name   = "kr-glue-role"
      actions     = ["sts:AssumeRole"]
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
      sid         = "GlueAsesRoleSid"
      resources   = ["*"]
    }

    role_firehose_kn = {
      role_name   = "kr-firehose-role"
      actions     = ["sts:AssumeRole"]
      type        = "Service"
      identifiers = ["kinesis.amazonaws.com"]
      sid         = "KinesisAsesRoleSid"
    }
  }

  firehose = {
    deliveryStream_name = "kr-delivery-stream"
  }

  policy = {
    region = "us-east-1"
    glue = {
      name = "kr-glue-pl"
      sid  = "GluePl"
      allowed_services = [
        "glue:*"
      ]
    }
  }

  cloudwatch = {
    loggroup = {
      name = "kr-kinesis-lg"
    }

    streamlog = {
      name = "kr-kinesis-streamlog"
    }
  }

}