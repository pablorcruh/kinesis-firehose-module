variable "name" {}

variable "buffer_size" {
    type = number
    default = 128
}

variable "buffer_interval" {
    type = number
    default = 60
}

variable "bucket_arn" {}

variable "enable_logs" {
    default = false
}

variable "loggroup_name" {
    type = string
    default = "test"
}

variable "streamlog_name" {
    type = string
    default = "test"
}

variable "database_name" {
    type = string
    default = "test"
}

variable "catalogtable_name" {
    type = string
    default = "test"
}

variable "deliveryStream_name" {
    type = string
    default = "test"
}
