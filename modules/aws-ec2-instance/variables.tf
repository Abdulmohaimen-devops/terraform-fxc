# EC2 instance size
variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance."
}

# EC2 instance size
variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance."

  default = "t2.micro"
}

# bucket name that will store the backup
variable "bucket_name" {
  type        = string
  description = "s3 bucket name that has backup"
}

variable "backup_path" {
  type        = string
  description = "the path of the backup"
}

variable "ami_version" {
  type        = string
  description = "ec2 ami version"
  default     = "amzn2"
}
