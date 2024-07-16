data "aws_ami" "amazon-linux" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["${var.ami_version}-ami-hvm*"]
 }
}

