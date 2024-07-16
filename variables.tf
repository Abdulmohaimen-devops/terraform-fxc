variable "region" {
  type        = string
  description = "AWS region for all resources."
  default = "eu-west-2"
}

variable "bucket_name" {
  type        = string
  description = "backup backet name"
  default = "my-backup-bucket"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance."
  default = "t2.micro"
}

variable "backup_path" {
  type        = string
  description = "the path of the backup"
  default = "/etc"
}
