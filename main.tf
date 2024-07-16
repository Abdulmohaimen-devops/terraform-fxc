
# random string for instance name
resource "random_pet" "instance" {
  length = 2
}

# Main resource to create ec2 and any other related resources
module "ec2-instance" {
  source = "./modules/aws-ec2-instance"

  instance_name = random_pet.instance.id
  instance_type = var.instance_type
  ami_version   = var.ami_version
  
  bucket_name   = var.bucket_name
  backup_path   = var.backup_path
}


output "instance_ip_addr" {
  value = module.ec2-instance.instance_public_ip
}

output "backup_path" {
  value = "https://${var.bucket_name}/backup-YYYY-MM-DDT02-00-00.tar.gz"
}