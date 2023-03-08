variable "name" {}

variable "firehose_role_arn" {}

variable "buffer_size" {}

variable "buffer_interval" {}

variable "bucket_arn" {}

variable "enable_logs" {
    default = false
}

variable "loggroup_name" {}

variable "streamlog_name" {}

variable "database_name" {}

variable "catalogtable_name" {}

