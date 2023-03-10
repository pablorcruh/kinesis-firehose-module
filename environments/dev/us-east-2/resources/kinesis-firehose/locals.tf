locals {
  glue = {
    catalog_database_name        = "kr-glue-table-catalog"
    catalog_database_description = "kr-catalog-description"
    catalog_tablename            = "kr-catalog_tablename"
  }


  s3 = {
    bucket = {
      bucket_name = "test bucket"
      effect_s3   = "Allow"
      sid_s3      = "AllowPublicAccess"
    }
  }

  role = {
    role_glue_kn = {
      role_name   = "kr-glue-role"
      actions     = ["sts:AssumeRole"]
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
      sid         = ""
    }

    role_firehose_kn = {
      role_name   = "kr-firehose-role"
      actions     = ["sts:AssumeRole"]
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
      sid         = ""
    }


  }

  policy = {
    glue = {
      name = "kr-glue-pl"
      sid  = "GluePl"
      allowed_services = [
        "glue:*"
      ]
    }

    firehose = {
      name = "kr-firehose-pl"
      sid  = "FirehosePl"
      allowed_services = [
        "firehose:*"
      ]
    }
  }

  cloudwatch = {
    loggroup ={
      name = "kr-kinesis-lg"
    }

    streamlog = {
      name = "kr-kinesis-streamlog"
    }
  }
}